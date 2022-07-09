// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./RentalStructure.sol";

abstract contract RentalProposition is RentalStructure {

    event CancelReservation(uint rentId, address proposer);

    function cancelReservation(uint rentContractId) public onlyParticipant(rentContractId) {
        require(rentContract[rentContractId].state == RentalContractState.Proposed);
        
        // Based on the time before the rent, we could have some fees
        rentContract[rentContractId].state = RentalContractState.Booked;

        emit CancelReservation(rentContractId, msg.sender);
        
    }


}