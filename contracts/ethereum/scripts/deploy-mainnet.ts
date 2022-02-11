import { ethers } from "hardhat";

async function main() {
  const TeleportCustody = await ethers.getContractFactory("TeleportCustody");
  const teleportCustody = await TeleportCustody.deploy("0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48");
  await teleportCustody.deployed();
  console.log(`teleport address: ${teleportCustody.address}`);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
