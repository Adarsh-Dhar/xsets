const hre = require("hardhat");

async function main() {
    // const DAOGovernance = await hre.ethers.getContractFactory("Pitch");
    // const daoGovernance = await DAOGovernance.deploy();
    // await daoGovernance.deployed();
    // console.log("DAOGovernance deployed to:", daoGovernance.address);

    // const DAO = await hre.ethers.getContractFactory("DAO");
    // const dao = await DAO.deploy();
    // await dao.deployed();

    // const DAOMembership = await hre.ethers.getContractFactory("DAOMembership");
    // const daoMembership = await DAOMembership.deploy();
    // await daoMembership.deployed();
    // console.log("DAOMembership deployed to:", daoMembership.address);
    

    // const DAOTokenDistribution = await hre.ethers.getContractFactory("DAOTokenDistribution");
    // const daoTokenDistribution = await DAOTokenDistribution.deploy();
    // await daoTokenDistribution.deployed();
    // console.log("DAOTokenDistribution deployed to:", daoTokenDistribution.address);

    // const DAOToken = await hre.ethers.getContractFactory("DAOToken");
    // const daoToken = await DAOToken.deploy();
    // await daoToken.deployed();
    // console.log("DAOToken deployed to:", daoToken.address);

    
    // const DAOTreasury = await hre.ethers.getContractFactory("DAOTreasury");
    // const daoTreasury = await DAOTreasury.deploy();
    // await daoTreasury.deployed();
    // console.log("DAOTreasury deployed to:", daoTreasury.address);

    const Nft = await hre.ethers.getContractFactory("Nft");
    const nft = await Nft.deploy();
    await nft.deployed();
    console.log("DAOVoting deployed to:", nft.address);
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });