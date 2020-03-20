pragma solidity 0.5.16;

import "truffle/Assert.sol";
import "../contracts/Funding.sol";
import "truffle/DeployedAddresses.sol";

contract FundingTest {
  function testSettingAnOwnerDuringCreation() public {
    Funding funding = new Funding();
    Assert.equal(funding.owner(), address(this), string("An owner is different than a deployer"));
  }

  function testSettingAnOwnerOfDeployedContract() public {
    Funding funding = Funding(DeployedAddresses.Funding());
    Assert.equal(funding.owner(), msg.sender, "An owner is different than a deployer");
  }
}
