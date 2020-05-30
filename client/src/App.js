import React, { useState } from 'react';
import Web3 from 'web3';
import { signAbi } from './abi/abis';
import './App.css';

const web3 = new Web3(Web3.givenProvider);
// contract address is provided by Truffle migration
const contractAddr = '0x8AC7BA95A2cB5DeF821b5019E83c222B97CbF254';
const SignContract = new web3.eth.Contract(signAbi, contractAddr);

function App() {
  const [signees, setSignees] = useState("");
  const [signed, setSigned] = useState("");
  const [documentHash, setDocumentHash] = useState("");
  const [signee, setSignee] = useState("");
  const [documentOwner, setDocumentOwner] = useState("");
  
  const handleUploadDocument = async (e) => {
    console.log(documentHash, signee)
    e.preventDefault();
    const accounts = await window.ethereum.enable();
    const account = accounts[0];
    const gas = await SignContract.methods.addSignee(documentHash, signee).estimateGas();
    const result = await SignContract.methods.addSignee(documentHash, signee).send({
      from: account,
      gas
    })
    console.log(result);
  }

  const handleSign = async (e) => {
    e.preventDefault();
    const accounts = await window.ethereum.enable();
    const account = accounts[0];
    const gas = await SignContract.methods.sign(documentOwner, documentHash).estimateGas();
    const result = await SignContract.methods.sign(documentOwner, documentHash).send({
      from: account,
      gas
    })
    console.log(result);
  }

  const handleGetAllSignees = async (e) => {
    e.preventDefault();
    const result = await SignContract.methods.getAllSignees(documentOwner, documentHash)
      .call();
    setSignees(result);
    console.log(result);
  }

  const handleGetAllSigned = async (e) => {
    e.preventDefault();
    const result = await SignContract.methods.getAllSigned(documentOwner, documentHash)
      .call();
    setSigned(result);
    console.log(result);
  }

  return (
    <div className="App">
      <header className="App-header">
        <form onSubmit={handleUploadDocument}>
          <b>Add Document</b>
          <br />
          <label>
            Signee:
            <input
              type="text"
              name="signee"
              value={signee}
              onChange={e => setSignee(e.target.value)} />
          </label>
          <br />
          <label>
            Document Hash:
            <input
              type="text"
              name="signee"
              value={documentHash}
              onChange={e => setDocumentHash(e.target.value)} />
          </label>
          <br />
          <input type="submit" value="Upload Document" />
        </form>
        <br />
        <br />
        <form onSubmit={handleGetAllSignees}>
          <b>Get Signees</b>
          <br />
          <label>
            Document Owner:
            <input
              type="text"
              name="signee"
              value={documentOwner}
              onChange={e => setDocumentOwner(e.target.value)} />
          </label>
          <br />
          <label>
            Document Hash:
            <input
              type="text"
              name="signee"
              value={documentHash}
              onChange={e => setDocumentHash(e.target.value)} />
          </label>
          <br />
          <input type="submit" value="Get Signees" />
        </form>
        <br />
        {signees != "" && ("Signees: " + signees) }
        <br />
        <br />
        <form onSubmit={handleSign}>
          <b>Sign a Document</b>
          <br />
          <label>
            Document Owner:
            <input
              type="text"
              name="signee"
              value={documentOwner}
              onChange={e => setDocumentOwner(e.target.value)} />
          </label>
          <br />
          <label>
            Document Hash:
            <input
              type="text"
              name="signee"
              value={documentHash}
              onChange={e => setDocumentHash(e.target.value)} />
          </label>
          <br />
          <input type="submit" value="Sign" />
        </form>

        <br />
        <br />
        <form onSubmit={handleGetAllSigned}>
          <b>Get All Signed</b>
          <br />
          <label>
            Document Owner:
            <input
              type="text"
              name="signee"
              value={documentOwner}
              onChange={e => setDocumentOwner(e.target.value)} />
          </label>
          <br />
          <label>
            Document Hash:
            <input
              type="text"
              name="signee"
              value={documentHash}
              onChange={e => setDocumentHash(e.target.value)} />
          </label>
          <br />
          <input type="submit" value="Get Signed" />
        </form>
        <br />
        {signed != "" && ("Signed: " + signed) }

      </header>
    </div>
  );
}

export default App;
