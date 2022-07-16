// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./RentalFinalization.sol";

contract RentalContract is RentalFinalization {

    constructor(address verifierContractAddress, address CarHelperAddress) {
        verifier = Verifier(verifierContractAddress);
        carHelper = CarHelper(CarHelperAddress);
    }

}