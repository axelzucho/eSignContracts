// contracts/Clock.sol
pragma solidity 0.6.4;

contract Clock {
  uint private timestamp;

  function getNow() public view returns (uint) {
    if (timestamp > 0) {
      return timestamp;
    }
    return now;
  }

  function setNow(uint _timestamp) public returns (uint) {
    timestamp = _timestamp;
  }
}