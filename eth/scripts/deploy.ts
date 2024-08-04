const hre = require("hardhat");

async function main() {
  const MyNft = await hre.ethers.getContractFactory("MyNft");
    const nft = await MyNft.deploy();
    await nft.waitForDeployment();
    console.log("Nft deployed to:", nft.target);

    const BridgeCoordinator = await hre.ethers.getContractFactory("BridgeCoordinator");
    const bridgeCoordinator = await BridgeCoordinator.deploy();
    await bridgeCoordinator.waitForDeployment();
    console.log("Nft deployed to:", bridgeCoordinator.target);

    const WormholeBridge = await hre.ethers.getContractFactory("WormholeBridge");
    const wormholeBridge = await WormholeBridge.deploy();
    await wormholeBridge.waitForDeployment();
    console.log("Nft deployed to:", wormholeBridge.target);
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });