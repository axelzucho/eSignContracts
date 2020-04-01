pragma solidity 0.6.4;

contract Sign {
  address public owner;

  // A structure for uniquely identifying a document
  struct Document {
    address owner;
    string document; // The word document is used instead of hash, because the latter is reserved
  }

  // Strcuture for indicating signees and status of signatures
  struct Signature {
    address signee;
    bool isSigned;
  }

  // Registry for documents and its signatures
  mapping(bytes32 => Signature[]) public registry;

  constructor() public {
    owner = msg.sender;
  }

  // Returns key, from a Document structure, to access Signatures in registry
  function keyFromDocument(Document memory document) private pure returns (bytes32) {
    return keccak256(abi.encode(document.owner, document.document));
  }

  // Creates a new entry for a hashed document, owned by sender
  function uploadDocument(bytes memory document) public {

  }

  // Adds new signee address to document signee list
  function addSignee(bytes memory document, address signee) public {

  }

  // Signs provided document if sender is allowed to
  function sign(address _owner, bytes memory document) public returns(bool) {

  }

  // Returns list of document signees
  function getSignees(address _owner, bytes memory document) public returns(address[] memory) {

  }
}
