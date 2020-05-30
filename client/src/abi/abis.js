export const signAbi = [
  {
    "inputs": [],
    "stateMutability": "nonpayable",
    "type": "constructor"
  },
  {
    "inputs": [],
    "name": "owner",
    "outputs": [
      {
        "internalType": "address",
        "name": "",
        "type": "address"
      }
    ],
    "stateMutability": "view",
    "type": "function",
    "constant": true
  },
  {
    "inputs": [
      {
        "internalType": "bytes32",
        "name": "",
        "type": "bytes32"
      },
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "name": "registry",
    "outputs": [
      {
        "internalType": "address",
        "name": "signee",
        "type": "address"
      },
      {
        "internalType": "bool",
        "name": "isSigned",
        "type": "bool"
      }
    ],
    "stateMutability": "view",
    "type": "function",
    "constant": true
  },
  {
    "inputs": [
      {
        "internalType": "string",
        "name": "documentHash",
        "type": "string"
      },
      {
        "internalType": "address",
        "name": "signee",
        "type": "address"
      }
    ],
    "name": "addSignee",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "documentOwner",
        "type": "address"
      },
      {
        "internalType": "string",
        "name": "documentHash",
        "type": "string"
      }
    ],
    "name": "sign",
    "outputs": [
      {
        "internalType": "bool",
        "name": "",
        "type": "bool"
      }
    ],
    "stateMutability": "payable",
    "type": "function",
    "payable": true
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "documentOwner",
        "type": "address"
      },
      {
        "internalType": "string",
        "name": "documentHash",
        "type": "string"
      }
    ],
    "name": "getAllSignees",
    "outputs": [
      {
        "internalType": "address[]",
        "name": "",
        "type": "address[]"
      }
    ],
    "stateMutability": "view",
    "type": "function",
    "constant": true
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "documentOwner",
        "type": "address"
      },
      {
        "internalType": "string",
        "name": "documentHash",
        "type": "string"
      }
    ],
    "name": "getAllSigned",
    "outputs": [
      {
        "internalType": "address[]",
        "name": "",
        "type": "address[]"
      }
    ],
    "stateMutability": "view",
    "type": "function",
    "constant": true
  }
]