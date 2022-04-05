const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Deploy", function () {
  it("Contract deploy", async function () {
    const Mal = await ethers.getContractFactory("Mal");
    const mal = await Mal.deploy();
    await mal.deployed();

    const Vault = await ethers.getContractFactory("Vault");
    const vault = await Vault.deploy(mal.address);

    expect(1).to.equal(1);
  });
});
