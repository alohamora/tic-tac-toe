var TicTacToe = artifacts.require("TicTacToe");

module.exports = function(deployer) {
   deployer.deploy(TicTacToe, {value: web3.toWei(0.000000000000000099)});
};