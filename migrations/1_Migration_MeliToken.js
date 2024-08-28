const MeliToken = artifacts.require("MeliToken.sol");

module.exports = function (deployer) {
  deployer.deploy(MeliToken);
};
