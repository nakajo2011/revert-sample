var Callee = artifacts.require("Callee.sol");
var RevertSample = artifacts.require("RevertSample.sol");

module.exports = async (deployer, network) => {
  deployer.deploy(RevertSample, Callee.address);
};
