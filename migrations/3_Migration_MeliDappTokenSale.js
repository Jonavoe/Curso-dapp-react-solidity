const MeliDappTokenSale = artifacts.require("MeliDappTokenSale.sol");

module.exports = function (deployer) {
  deployer.deploy(
    MeliDappTokenSale,
    "0x6a1B5d9980e2a40490a20B3F5801eb4522378B35"
  );
};
