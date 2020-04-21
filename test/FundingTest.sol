pragma solidity 0.6.4;

import "truffle/Assert.sol";
import "../contracts/Funding.sol";
import "truffle/DeployedAddresses.sol";

contract FundingTest {
  uint public initialBalance = 10 ether;
  function testSettingAnOwnerDuringCreation() public {
    Funding funding = new Funding();
    Assert.equal(funding.owner(), address(this), string("An owner is different than a deployer"));
  }

  function testSettingAnOwnerOfDeployedContract() public {
    Funding funding = Funding(DeployedAddresses.Funding());
    Assert.equal(funding.owner(), msg.sender, "An owner is different than a deployer");
  }

  function testAcceptingDonations() public {
    Funding funding = new Funding();
    Assert.equal(funding.raised(), 0, "Initial raised amount is different than 0");
    funding.donate{value: 10 finney}();
    funding.donate{value: 20 finney}();
    Assert.equal(funding.raised(), 30 finney, "Raised amount is different than sum of donations");
  }

  function testTrackingDonorsBalance() public {
    Funding funding = new Funding();
    funding.donate{value: 5 finney}();
    funding.donate{value: 15 finney}();
    Assert.equal(funding.balances(address(this)), 20 finney, "Donator balance is different than sum of donations");
  }

  function testTrackingDonorsBalance() public {
    Funding funding = new Funding();
    funding.donate{value: 5 finney}();
    funding.donate{value: 15 finney}();
    Assert.equal(funding.balances(address(this)), 20 finney, "Donator balance is different than sum of donations");
  }
}
