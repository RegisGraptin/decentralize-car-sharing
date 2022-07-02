
/**
 * 
 * autogenerated by solidity-visual-auditor
 * 
 * execute with: 
 *  #> truffle test <path/to/this/test.js>
 * 
 * */
 var CarFactory = artifacts.require("../contracts/CarFactory.sol");
var CarHelper = artifacts.require("/home/rere/Project/Crypto/Car/contracts/CarHelper.sol");

contract('CarHelper', (accounts) => {
    var creatorAddress = accounts[0];
    var firstOwnerAddress = accounts[1];
    var secondOwnerAddress = accounts[2];
    var externalAddress = accounts[3];
    var unprivilegedAddress = accounts[4]
    /* create named accounts for contract roles */

    before(async () => {
        /* before tests */
    })
    
    beforeEach(async () => {
        /* before each context */
    })

    it('should revert if ...', () => {
        return CarHelper.deployed()
            .then(instance => {
                return instance.publicOrExternalContractMethod(argument1, argument2, {from:externalAddress});
            })
            .then(result => {
                assert.fail();
            })
            .catch(error => {
                assert.notEqual(error.message, "assert.fail()", "Reason ...");
            });
        });

    context('testgroup - security tests - description...', () => {
        
        let newCarHelper;

        //deploy a new contract
        before(async () => {
            /* before tests */
            newCarHelper  = await CarHelper.new()
        })
        

        beforeEach(async () => {
            /* before each tests */
        })

        

        it('fails on getting an empty car list', async () => {
            var carListTransaction = await newCarHelper.getCarByOwner(creatorAddress);
            assert.isTrue(carListTransaction.length == 0)
        })

        it('fails on getting a car list with one car', async () => {    
            var transaction = await newCarHelper.createCar(
                    "Renault Twingo",
                    "Citadine",
                    "Vehicule",
                    "Diesel",
                    "Manuelle",
                    100000,
                    2012,
                    3,
                    4, 
                    { from: firstOwnerAddress }
            );
    
            var carListTransaction = await newCarHelper.getCarByOwner(firstOwnerAddress);
            assert.isTrue(carListTransaction.length == 1)

            var carListTransaction = await newCarHelper.getCarByOwner(secondOwnerAddress);
            assert.isTrue(carListTransaction.length == 0)
            
        })



    })
});