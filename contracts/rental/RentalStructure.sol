// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "../Route.sol";
import "../CarFactory.sol";

abstract contract RentalStructure {

    /**
     * Indicate the state of the contract
     */
    enum RentalContractState {
        Proposed,
        Canceled,
        Booked,
        Rented,
        Returned
    }

    /**
     * Car Factory contract.
     */
    CarFactory carFactory;

    struct RentContract {
        address carOwner;
        address client;
        uint carId;

        uint price;

        uint bookedDate;

        Route route;

        bool approvedByClient;
        bool approvedByOwner;

        RentalContractState state;

        
    }

    /**
     * Only the owner of the car or the client can execute the function.
     */
    modifier onlyParticipant (uint rentContractId) {
        require(msg.sender == rentContract[rentContractId].carOwner 
            || msg.sender == rentContract[rentContractId].client,
            "Only the client or the owner of the car can call this function."
        );
        _;
    }


    RentContract[] public rentContract;

    mapping (uint => address) public rentToOwner;
    mapping (uint => address) public rentToClient;

  
}
