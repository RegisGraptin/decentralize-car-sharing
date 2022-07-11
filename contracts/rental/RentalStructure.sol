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

    struct AcceptTwoParties {
        bool clientAccept;
        bool ownerAccept;
    }

    struct ProofOfExchange {
        // TODO :: Add the possibility to store timestamps

        bool clientAcceptExchange;
        bool ownerAcceptExchange;

        bytes32 ownerSecretRentCar;
        bytes32 clientSecretRentCar;
    }

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


        // TODO :: Reorganize variables + modify the test 
        

        bool returnCarOwner;
        bool returnCarClient;

        // TODO :: remplace the two boolean variables
        AcceptTwoParties bookProposition;

        ProofOfExchange proofOfExchange;
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
