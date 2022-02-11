import { ethers } from "hardhat";

async function main() {
  const Token = await ethers.getContractFactory("Token");
  const token = await Token.deploy("USD Coin", "USDC", 6);
  await token.deployed();
  console.log(`token address: ${token.address}`);

  const TeleportCustody = await ethers.getContractFactory("TeleportCustody");
  const teleportCustody = await TeleportCustody.deploy(token.address);
  await teleportCustody.deployed();
  console.log(`teleport address: ${teleportCustody.address}`);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
