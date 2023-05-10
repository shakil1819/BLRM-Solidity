const LandRecord = artifacts.require("LandRecord");
const LandRecordToken = artifacts.require("LandRecordToken");

module.exports = function(deployer) {
  deployer.deploy(LandRecordToken, "LandRecordToken", "LRT").then(function() {
    return deployer.deploy(LandRecord, LandRecordToken.address);
  });
};
