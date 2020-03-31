pragma solidity 0.6.4;

contract Sign {
  address public owner;
  
  mapping(string => address[]) public signed; // Who has signed a given document
  mapping(string => address[]) public signees; // Who is allowed to sign a given document
  mapping(address => string[]) public owners; // What documents any given address owns

  constructor() public {
    owner = msg.sender;
  }

  // Creates a new entry for a hashed document, owned by sender
  function uploadDocument(bytes memory document) public {

  }

  // Adds new signee address to document signee list
  function addSignee(bytes memory document, address signee) public {

  }

  // Signs provided document if sender is allowed to
  function sign(bytes memory document) public returns(bool) {

  }

  // Returns list of document signees
  function getSignees(bytes memory document) public returns(address[] memory) {

  }
}
