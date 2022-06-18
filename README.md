
# Decentralize car sharing system

Create a decentralize car sharing protocol.
This project will allow a company or a person to share his car to another entity. 

This project is a proof of concept (POC) for learning and implementing solidity contract.

[Warning] : This project is at his start, the project can evolve through the development process.


## User approach

- See the list of cars available.
- Request for a car. (Send information)
- Pending : (Owner => Accept/Reject of another person)
- Deposit of a guarantee.
- Get the car.
- Do his trip.
- Return of the car.


## Owner car 

- Send information of the car.
- Send information of the availability of the car.
- Accept/Reject car demand.
- Verification of the car before & after.



## Questions / Problems 

- How do we verify the state of the car before & after in a decentralize way ?
- How can we trust the two parts ? Central authority that verify and manage the conflicts ?
- How can we trust the information during the process (user/car/owner informations) ?
- How do we manage unexpected events ? 
  - Delay of the car ? And other reservation ?
  - Accident ?
  - Car cancel by the owner / client ?




## Personal notes

> https://www.quicknode.com/guides/web3-sdks/how-to-setup-local-development-environment-for-solidity

```bash
npm install -g truffle
truffle init

```

Init successful, sweet!

Try our scaffold commands to get started:
  $ truffle create contract YourContractName # scaffold a contract
  $ truffle create test YourTestName         # scaffold a test

http://trufflesuite.com/docs



