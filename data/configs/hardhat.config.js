/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  networks: {
    localhost: {
      "url": "http://172.20.0.253:8545"
    },
    hardhat: {
      chainId: 1281,
      loggingEnabled: true,
      mining: {
        auto: false,
        interval: 3500
      }
    }
  }
};