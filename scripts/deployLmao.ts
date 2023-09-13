import { ethers } from "hardhat";

async function main() {
  const network = 'SEPOLIA'; // Replace with the network name you want to use
  const [deployer] = await ethers.getSigners();

  console.log('Deploying contract with the account:', deployer.address);

  const tokenContract = await ethers.getContractFactory('LMAO');
  const contract = await tokenContract.deploy();

  await contract.waitForDeployment();

  console.log('Contract deployed to address:', contract.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
