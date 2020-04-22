pragma solidity 0.6.4;

import "truffle/Assert.sol";
import "../contracts/Sign.sol";
import "truffle/DeployedAddresses.sol";

contract SignTest {

  uint public initialBalance = 10 ether;
  string public docHash = "19a51f8e6b36d6d9628e063b2a7efb4162ab06e0f449f5fef9e721435c14079b";

  function testSignSettingAnOwnerDuringCreation() public {
    Sign sign = new Sign();
    Assert.equal(sign.owner(), address(this), string("An owner is different than a deployer"));
  }

  function testSignSettingAnOwnerOfDeployedContract() public {
    Sign sign = Sign(DeployedAddresses.Sign());
    Assert.equal(sign.owner(), msg.sender, "An owner is different than a deployer");
  }

  function testInitialSigneeSizeEmpty() public {
    Sign sign = new Sign();
    Assert.equal(sign.getAllSignees(address(this), docHash).length, 0, "Amount of initial signees is different than 0");
  }

  // function testTrackingDonorsBalance() public {
  //   Funding funding = new Funding();
  //   funding.donate{value: 5 finney}();
  //   funding.donate{value: 15 finney}();
  //   Assert.equal(funding.balances(address(this)), 20 finney, "Donator balance is different than sum of donations");
  // }

  // function testTrackingDonorsBalance() public {
  //   Funding funding = new Funding();
  //   funding.donate{value: 5 finney}();
  //   funding.donate{value: 15 finney}();
  //   Assert.equal(funding.balances(address(this)), 20 finney, "Donator balance is different than sum of donations");
  // }
}
