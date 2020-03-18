pragma solidity 0.5.16;

contract Funding {
  address public owner;

  constructor() public {
    owner = msg.sender;
  }
}
