// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./RentalProposition.sol";

/// @title Rental Reservation
/// @notice Manage the rental contract when the two parties have agreed on it. 
abstract contract RentalReservation is RentalProposition {

    event CancelReservation(uint rentId, address proposer);

    event RentalReservationStart(uint rentId, address owner, address client);

    /// @notice Cancel a reservation when a rent contract have been accepted. 
    /// @dev We change the contract state and emit an event.
    /// @param rentContractId id of the contract
    /// @custom:future we can have additional fees based on the time of the cancel reservation
    function cancelReservation(uint rentContractId) public onlyParticipant(rentContractId) {
        require(rentContract[rentContractId].state == RentalContractState.Booked);

        // TODO :: Based on the time before the rent, we could have some fees
        rentContract[rentContractId].state = RentalContractState.Canceled;

        emit CancelReservation(rentContractId, msg.sender);
    }

    /// @notice The owner and the client proceed to the rent
    /// @dev Two booleans indicate if the exchange proceed or not
    /// @param rentContractId id of the contract
    /// @custom:future At the moment, we set it using two booleans. In future version, we should maybe 
    /// send a secret that the two participants need to share in real time to accept the contract.
    function exchange(uint rentContractId, bytes memory secret) public onlyParticipant(rentContractId) {
        require(rentContract[rentContractId].state == RentalContractState.Booked);

        // The owner accept the exchange
        if (rentContract[rentContractId].carOwner == msg.sender) {
            // Generate the hash of the secret
            bytes32 secret_hash = sha256(secret);
            if (rentContract[rentContractId].proofOfExchange.clientSecretRentCar == secret_hash) {
                rentContract[rentContractId].proofOfExchange.ownerAcceptExchange = true;
            }
        } 

        // The client accept the exchange
        if (rentContract[rentContractId].client == msg.sender) {
            bytes32 secret_hash = sha256(secret);
            if (rentContract[rentContractId].proofOfExchange.ownerSecretRentCar == secret_hash) {
                rentContract[rentContractId].proofOfExchange.clientAcceptExchange = true;
            }
        }

        // The two parties have agreed
        if (rentContract[rentContractId].proofOfExchange.ownerAcceptExchange 
            && rentContract[rentContractId].proofOfExchange.clientAcceptExchange) {
            rentContract[rentContractId].state = RentalContractState.Rented;

            // TODO :: Save the time of the validation of the two parties ?

            emit RentalReservationStart(rentContractId, rentContract[rentContractId].carOwner, rentContract[rentContractId].client);
        }

    }



}
