// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./RentalReservation.sol";

abstract contract RentalFinalization is RentalReservation {

    event RentalCarReturn(uint rentId, address owner, address client);

    /// @notice The client return the car to the owner.
    /// @dev Two booleans indicate if the client has return the car
    /// @param rentContractId id of the contract
    /// @custom:future At the moment, we set it using two booleans. In future version, we should maybe 
    /// send a secret that the two participants need to share in real time to accept the contract.
    function returnTheCar(uint rentContractId) public onlyParticipant(rentContractId) {
        require(rentContract[rentContractId].state == RentalContractState.Booked);

        // The owner accept the exchange
        if (rentContract[rentContractId].carOwner == msg.sender) {
            rentContract[rentContractId].returnCarOwner = true;
        } 

        // The client accept the exchange
        if (rentContract[rentContractId].client == msg.sender) {
            rentContract[rentContractId].returnCarClient = true;
        }

        // The two parties have agreed
        // TODO :: Check the variable name 
        
        if (rentContract[rentContractId].returnCarOwner && rentContract[rentContractId].returnCarClient) {
            rentContract[rentContractId].state = RentalContractState.Returned;
            
            // TODO :: Save the time of the validation of the two parties ?
            
            emit RentalCarReturn(rentContractId, rentContract[rentContractId].carOwner, rentContract[rentContractId].client);
        }

    }

}
