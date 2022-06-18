
var CarFactory = artifacts.require("../contracts/CarFactory.sol");

contract('CarFactory', (accounts) => {

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
        return CarFactory.deployed()
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
        
        let newCarFactory;

        //deploy a new contract
        before(async () => {
            /* before tests */
            newCarFactory =  await CarFactory.new()
        })
        

        beforeEach(async () => {
            /* before each tests */
        })

        
        it('fails on creating new car', async () => {
            var transaction = await newCarFactory.createCar(
                "Renault Twingo",
                "Citadine",
                "Vehicule",
                "Diesel",
                "Manuelle",
                100000,
                2012,
                3,
                4
            );

            assert.isTrue(transaction.receipt.status);
            assert.equal(transaction.logs[0].event, "NewCar");
            assert.equal(transaction.logs[0].args.name, "Renault Twingo");
        })

    })
});
