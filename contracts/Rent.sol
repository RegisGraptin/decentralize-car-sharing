// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Route.sol";

contract Rent {

    event ProposedRent(address proposer);
    event ApproveRent(address proposer);
    event LockContract(address proposer);

    struct RentContract {
        address carOwner;
        address client;
        uint carId;

        uint price;

        Route route;

        bool approvedByOwner;
        bool approvedByClient;
        bool locked;
    }

    RentContract[] public rentContract;

    mapping (uint => address) rentToOwner;
    mapping (uint => address) rentToClient;

    /**
     * Create a new rent proposition.
     */
    function createRent(address carOwner, uint carId, address client, uint price, Route memory route) public {
        // Only the client can request a rent contract
        require(msg.sender == client);

        // Add the contract
        rentContract.push(
            RentContract(carOwner, client, carId, price, route, false, false, false)
        );
        uint _id = rentContract.length - 1;

        // Links the contract id to the client and the owner
        rentToClient[_id] = client;
        rentToOwner[_id]  = carOwner;
    }



    /**
     * Approved by one of the party the contract.
     *
     * Require: 
     *  - Only the client or the owner of the car can participate in the negociation.
     *  - The contract do not be locked.
     */
    function approved(uint rentContractId) public {
        require(msg.sender == rentContract[rentContractId].carOwner || msg.sender == rentContract[rentContractId].client);
        require(! rentContract[rentContractId].locked);

        if (msg.sender == rentContract[rentContractId].carOwner) {
            rentContract[rentContractId].approvedByOwner = true;
        }

        if (msg.sender == rentContract[rentContractId].client) {
            rentContract[rentContractId].approvedByClient = true;
        }

        if (rentContract[rentContractId].approvedByOwner && rentContract[rentContractId].approvedByClient) {
            emit ApproveRent(msg.sender);
        } else {
            emit ProposedRent(msg.sender);
        }
    }

    /**
     * Validate the contract. Both parties have agreed on the contract. We can now lock the contract.
     */
    function validate(uint rentContractId) public {
        require(msg.sender == rentContract[rentContractId].carOwner || msg.sender == rentContract[rentContractId].client);

        if (rentContract[rentContractId].approvedByClient && rentContract[rentContractId].approvedByOwner) {
            rentContract[rentContractId].locked = true;
            emit LockContract(msg.sender);
        }

    }

}
