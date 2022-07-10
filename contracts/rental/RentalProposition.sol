// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./RentalStructure.sol";

/// @title Rental Proposition
/// @notice Manage the proposition of a new rental contract.
abstract contract RentalProposition is RentalStructure {
    

    event NewRentProposition(uint rentId, address owner, address client);

    event ProposedRent(uint rentId, address proposer);
    event ApproveRent(uint rentId, address proposer);
    event LockContract(address proposer);
    
    /**
     * Create a new rent proposition.
     */
    function createRent(address carOwner, uint carId, address client, uint price, Route memory route) public {
        // Only the client can request a rent contract
        require(msg.sender == client);

        // Check the address of the car owner
        require(carFactory.carToOwner(carId) == carOwner);

        // TODO :: Check using the Verifier that the owner/car/client are valid.


        // TODO :: The client should have accepeted before hand the contract, only the owner need to accept/modify/reject the offer.

        // Add the contract
        rentContract.push(
            RentContract(carOwner, client, carId, price, 0, route, true, false, RentalContractState.Proposed, false, false)
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
        require(rentContract[rentContractId].state == RentalContractState.Proposed);

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
        require(rentContract[rentContractId].state == RentalContractState.Proposed);

        if (rentContract[rentContractId].approvedByClient && rentContract[rentContractId].approvedByOwner) {
            rentContract[rentContractId].state = RentalContractState.Booked;
            rentContract[rentContractId].bookedDate = block.timestamp;
            emit LockContract(msg.sender);
        }
    }

    /**
     * Reject a contract.
     */
    function reject(uint rentContractId) public {
        require(msg.sender == rentContract[rentContractId].carOwner || msg.sender == rentContract[rentContractId].client);
        require(rentContract[rentContractId].state == RentalContractState.Proposed);
        rentContract[rentContractId].state = RentalContractState.Canceled;
    }


}
