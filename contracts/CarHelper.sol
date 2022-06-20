// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./CarFactory.sol";

contract CarHelper is CarFactory {

    function getCarByOwner(address _owner) external view returns(uint[] memory) {
        uint[] memory carList = new uint[](ownerCarCount[_owner]);
        uint counter = 0;
        for (uint i = 0; i < cars.length; i++) {
            if (carToOwner[i] == _owner) {
                carList[counter] = i;
                counter++;
            }
        }
        return carList;
    }

}