var Callee = artifacts.require("./Callee.sol");

module.exports = function(deployer) {
  deployer.deploy(Callee);
};
