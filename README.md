
# Decentralize car sharing system

Cars allow us to move easily for more or less long trips. However, a large part of a car's life is spent parked in one place. With increasing problems such as population growth, energy or even environmental issues, we are reaching a stage where owning a car will become more and more complciated. Indeed, building a car requires a large amount of material. Additionally, as cities becoming denser and denser, it is becoming more and more difficult to find a place to park your car. This generates additional costs for a low usage.

This is where car sharing comes. The idea is to rent your car, when you do not need it. From the owner's perspective, it generates additional income, knowing that your car generates costs by staying parked (insurance, parking space...). From the user's perspective, it allows you to rent a car at low cost, without having the constraints of owning a car (where to park my car, maintenance of the car that I do not use...). Car sharing will be at the heart of tomorrow's issues. 

Through the car rental, we wish to put in relation two people, one wishing to rent a car, the other wishing to rent it. Thus a contract must be created to ensure that the exchange take place during a given period. This is where the blockchain comes in. Indeed, it allows the creation of a contract between two parties in a decentralized way. The decentralization allows the simplification of the connection, the creation of the contract, but also to be transparent on the additional costs related to this exchange.

Through this project, we propose a decentralized car-sharing system allowing a owner to rent his car and a client to rent it. This project his currently a proof of concept (POC), but do not hesitate to contact me, if you are interested.

## Getting Started

### Installation

First, clone the repository.

```
git clone https://github.com/rere-rere/decentralize-car-sharing
cd decentralize-car-sharing
```

Then, install the dependencies of our project. 

```bash
npm install -g truffle
npm install
```

You are ready to compile and deploy our project.

### Compilation 

```bash
truffle compile
```

### Local Deployment

At the current state of this project, we are testing the functionnality of this project. 
If you want to deploy this project locally, you can first download [ganache](https://trufflesuite.com/ganache/) and run it. You will need to configure the network as follow the `truffle-config.js` file, as defined in the variables `networks` > `localhost`.

Then, you will simply need to run:

```bash
truffle deploy --network localhost
```

## Contribution

Any contribution are welcome. If you have suggestion for this project, do not hesite to share your through by opening an issue.
If you want to contribute to this repository by coding, feel free to fork the repo and create a pull request.

### Testing

A sets of tests are available. Do not hesitate to run them, it is created for that purpose!

```bash
truffle test
```
