const Verifier = artifacts.require("Verifier");
const CarFactory = artifacts.require("CarFactory");
const RentContract = artifacts.require("rental/RentalContract");

module.exports = function (deployer) {
  
  deployer.then(async () => {
    await deployer.deploy(Verifier);
    await deployer.deploy(CarFactory);
    await deployer.deploy(RentContract, Verifier.address, CarFactory.address);
  })

};
