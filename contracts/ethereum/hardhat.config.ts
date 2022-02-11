import { HardhatUserConfig } from "hardhat/config";
import "@nomiclabs/hardhat-waffle";
import "@nomiclabs/hardhat-ethers";
import "@nomiclabs/hardhat-etherscan";

const config: HardhatUserConfig = {
  networks: {
    rinkeby: {
      url: "https://rinkeby.infura.io/v3/", // rinkeby url
      accounts: [],
    },
    mainnet: {
      url: "https://mainnet.infura.io/v3/",
      accounts: [],
      gasPrice: 80000000000
    },
  },
  solidity: {
    compilers: [
      {
        version: "0.8.7",
        settings: {
          optimizer: { enabled: true, runs: 1000 },
        },
      },
    ],
  },
  etherscan: {
    apiKey: "", // etherscan api key here...
  },
};

export default config;
