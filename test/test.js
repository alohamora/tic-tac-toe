const TicTacToe = artifacts.require('TicTacToe.sol')

let contractInstance

contract('Full Test', (accounts) => {
    const player3 = accounts[0];
    const player1 = accounts[1];
    const player2 = accounts[2];

    beforeEach(async () => {
        contractInstance = await TicTacToe.deployed({value: web3.toWei(0.000000000000000099) , from: player1});
    })
    it('register players', async () => {
        try{
            console.log("asdfa");
            await contractInstance.register_second_player({value: web3.toWei(0.000000000000000099) ,from: player2});
            console.log("asdf");
            var x= contractInstance.count_getter({from:player1});
            console.log("asdfa");
            assert.equal(x, 1, "Player didn't get registered.");
            console.log("asdfa");
        }
        catch (e) {
            assert.fail("Player didn't get registered.");
        }
    })
    it('register invalid player', async () => {
        try{
            await contractInstance.register_second_player({value: web3.toWei(0.000000000000000099) ,from: player3});
            assert.fail("Player got registered.");
        }
        catch (e) {
            assert.ok("True", "Player didn't get registered.");
        }
    })
})