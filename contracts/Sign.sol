pragma solidity 0.6.4;


contract Sign {
    address public owner;

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
    function getKey(address documentOwner, string memory documentHash)
        private
        pure
        returns (bytes32)
    {
        return keccak256(abi.encode(documentOwner, documentHash));
    }

    // Adds new signee address to document signee list
    function addSignee(string memory documentHash, address signee) public {
        Sign.Signature[] storage signatures = registry[getKey(
            msg.sender,
            documentHash
        )];
        Sign.Signature memory signature = Signature(signee, false);
        signatures.push(signature);
    }

    // Signs provided document if sender is allowed to
    function sign(address _owner, bytes memory document)
        public
        returns (bool)
    {}

    // Returns list of document signees
    function getAllSignees(address documentOwner, string memory documentHash)
        public
        view
        returns (address[] memory)
    {
        Sign.Signature[] memory signatures = registry[getKey(
            documentOwner,
            documentHash
        )];
        address[] memory signatureAddresses = new address[](signatures.length);
        for (uint8 index = 0; index < signatures.length; index++) {
            Sign.Signature memory signature = signatures[index];
            signatureAddresses[index] = signature.signee;
        }
        return signatureAddresses;
    }
}
