pragma solidity 0.5.16;

contract Funding {
  uint public raised;
  address public owner;
  mapping(address => uint) public balances;

  constructor() public {
    owner = msg.sender;
  }

  function donate() public payable {
    balances[msg.sender] += msg.value;
    raised += msg.value;
  }
}
