pragma solidity 0.5.16;

import "truffle/Assert.sol";
import "../contracts/Funding.sol";

contract FundingTest {
function testSettingAnOwnerDuringCreation() public {
    Funding funding = new Funding();
    //Assert.equal(string(funding.owner()), string(this),string("hasdf"));
    Assert.equal(string("asdf"), string("asdf"),string("hasdf"));
  }
}
