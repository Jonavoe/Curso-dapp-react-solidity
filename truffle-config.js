require("dotenv").config();
const path = require("path");
const HDWalletProvider = require("@truffle/hdwallet-provider");

const secretKey = process.env.SECRET_KEY;
const address = process.env.ADDRESS;

module.exports = {
  contracts_build_directory: path.join(__dirname, "client/src/contracts"),
  networks: {
    development: {
      host: "127.0.0.1",
      port: "7545",
      network_id: "*",
    },
    bsc_testnet: {
      provider: () =>
        new HDWalletProvider(
          secretKey,
          `https://bsc-testnet-dataseed.bnbchain.org`,
          0
        ),
      from: address,
      gas: "4500000",
      gasPrice: "10000000000",
      network_id: 97,
      confirmations: 10,
      timeoutBlocks: 10000,
      skipDryRun: true,
    },
  },
  compilers: {
    solc: {
      version: "0.8.0",
    },
  },
};
