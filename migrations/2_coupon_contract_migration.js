const artifacts = require("truffle-artifcats");

const DonationContract = artifacts.require("DonationContract");

module.exports = function (deployer) {
  deployer.deploy(DonationContract);
};
