// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "openzeppelin-solidity/contracts/access/Ownable.sol";

/** User Certification Contract.
 *  
 * Manage the list of clients and cars that have provided their information and been validated. 
 */
contract Verifier is Ownable {

    // List of clients that have verify his information for renting a car
    mapping(address => bool) public clients;

    // List of validated cars
    mapping(uint => bool) public cars;

    /** Update the list of validated clients.
     */
    function updateClients(
        address[] calldata clientsToAdd,
        address[] calldata clientsToRemove
    ) external onlyOwner {
        // Add clients
        for (uint i = 0; i < clientsToAdd.length; i++) {
            if (! clients[clientsToAdd[i]]) {
                clients[clientsToAdd[i]] = true;
            }
        }

        // Remove clients
        for (uint i = 0; i < clientsToRemove.length; i++) {
            if (clients[clientsToRemove[i]]){
                delete clients[clientsToRemove[i]];
            }
        }
    }

    /** Update the list of validated cars.
     */
    function updateCars(
        uint[] calldata carsToAdd,
        uint[] calldata carsToRemove
    ) external onlyOwner {
        // Add cars 
        for (uint i = 0; i < carsToAdd.length; i++) {
            if (! cars[carsToAdd[i]]) {
                cars[carsToAdd[i]] = true;
            }
        }

        // Remove cars
        for (uint i = 0; i < carsToRemove.length; i++) {
            if (cars[carsToRemove[i]]) {
                delete cars[carsToRemove[i]];
            }
        }

    }
}