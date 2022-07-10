// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./RentalStructure.sol";

/// @title Rental Proposition
/// @notice Manage the rental contract when the two parties have agreed on it. 
abstract contract RentalProposition is RentalStructure {

    event CancelReservation(uint rentId, address proposer);

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

}
