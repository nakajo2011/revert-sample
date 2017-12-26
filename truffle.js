var HDWalletProvider = require("truffle-hdwallet-provider");
var mnemonic = process.env.ROPSTEN_MNEMONIC;
var accessToken = process.env.INFURA_ACCESS_TOKEN;

module.exports = {
  networks: {
    live: {
      host: "localhost",
      port: 8545,
      network_id: "*"
    },
    ropsten: {
      provider: function() {
        return new HDWalletProvider(
            mnemonic,
            "https://ropsten.infura.io/" + accessToken
        );
      },
      network_id: 3,
      gas: 1000000,
      gasPrice: 10 * 1000000000
    },
    mainnet:{
    }
  }
};
