// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Route.sol";

contract Rent {

    event ProposedRent(address proposer);
    event ApproveRent(address proposer);
    event RejectRent(address proposer);


    struct RentContract {
        address carOwner;
        address client;
        uint carId;
        Route route;

        bool approvedByOwner;
        bool approvedByClient;
    }

    RentContract public rentContract; 

    constructor(address carOwner, uint carId, address client, Route memory route) {
        rentContract.carOwner = carOwner;
        rentContract.carId    = carId;
        rentContract.client   = client;
        rentContract.route    = route; 

        rentContract.approvedByOwner  = false;
        rentContract.approvedByClient = false;
    }


    function approved() public {
        require(msg.sender == rentContract.carOwner || msg.sender == rentContract.client);
        
        if (msg.sender == rentContract.carOwner) {
            rentContract.approvedByOwner = true;
        }

        if (msg.sender == rentContract.client) {
            rentContract.approvedByClient = true;
        }

        if (rentContract.approvedByOwner && rentContract.approvedByClient) {
            emit ApproveRent(msg.sender);
        } else {
            emit ProposedRent(msg.sender);
        }
    }

}
