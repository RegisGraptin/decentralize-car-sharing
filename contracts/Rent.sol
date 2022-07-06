// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Route.sol";
import "./CarFactory.sol";

contract Rent {

    CarFactory carFactory;

    constructor(address addr) {
        carFactory = CarFactory(addr);
    }


    event NewRentProposition(uint rentId, address owner, address client);

    event ProposedRent(uint rentId, address proposer);
    event ApproveRent(uint rentId, address proposer);
    event LockContract(address proposer);

    struct RentContract {
        address carOwner;
        address client;
        uint carId;

        uint price;

        Route route;

        bool approvedByClient;
        bool approvedByOwner;
        bool locked;
    }

    RentContract[] public rentContract;

    mapping (uint => address) public rentToOwner;
    mapping (uint => address) public rentToClient;

    /**
     * Create a new rent proposition.
     */
    function createRent(address carOwner, uint carId, address client, uint price, Route memory route) public {
        // Only the client can request a rent contract
        require(msg.sender == client);

        // Check the address of the car owner
        require(carFactory.carToOwner(carId) == carOwner);


        // TODO :: Verify the carOwner and the carId (should be the same)
        // TODO :: The client should have accepeted before hand the contract, only the owner need to accept/modify/reject the offer.

        // Add the contract
        rentContract.push(
            RentContract(carOwner, client, carId, price, route, true, false, false)
        );
        uint _id = rentContract.length - 1;

        // Links the contract id to the client and the owner
        rentToClient[_id] = client;
        rentToOwner[_id]  = carOwner;

        // Create an event for the created rent
        emit NewRentProposition(_id, carOwner, client);
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
            emit ApproveRent(rentContractId, msg.sender);
        } else {
            emit ProposedRent(rentContractId, msg.sender);
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
