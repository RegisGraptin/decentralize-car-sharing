const Verifier = artifacts.require("Verifier");
const CarHelper = artifacts.require("CarHelper");
const RentContract = artifacts.require("rental/RentalContract");

module.exports = function (deployer) {
  
  deployer.then(async () => {
    await deployer.deploy(Verifier);
    await deployer.deploy(CarHelper);
    await deployer.deploy(RentContract, Verifier.address, CarHelper.address);
  })

};
