pragma solidity 0.6.4;

import "truffle/Assert.sol";
import "../contracts/Sign.sol";
import "truffle/DeployedAddresses.sol";


contract SignTest {
    uint256 public initialBalance = 10 ether;
    string public docHash = "19a51f8e6b36d6d9628e063b2a7efb4162ab06e0f449f5fef9e721435c14079b";
    address public dummyAddress = 0xE0f5206BBD039e7b0592d8918820024e2a7437b9;

    function testSignSettingAnOwnerDuringCreation() public {
        Sign sign = new Sign();
        Assert.equal(
            sign.owner(),
            address(this),
            string("An owner is different than a deployer")
        );
    }

    function testSignSettingAnOwnerOfDeployedContract() public {
        Sign sign = Sign(DeployedAddresses.Sign());
        Assert.equal(
            sign.owner(),
            msg.sender,
            "An owner is different than a deployer"
        );
    }

    function testInitialSigneeSizeEmpty() public {
        Sign sign = new Sign();
        Assert.equal(
            sign.getAllSignees(address(this), docHash).length,
            0,
            "Amount of initial signees is different than 0"
        );
    }

    function testAddedSigneeSizeOne() public {
        Sign sign = new Sign();
        sign.addSignee(docHash, dummyAddress);
        Assert.equal(
            sign.getAllSignees(address(this), docHash).length,
            1,
            "Amount of added signees is different than 1"
        );
    }

    function testAddedRepeatedSigneesSizeOne() public {
        Sign sign = new Sign();
        sign.addSignee(docHash, dummyAddress);
        sign.addSignee(docHash, dummyAddress);
        Assert.equal(
            sign.getAllSignees(address(this), docHash).length,
            1,
            "Amount of repeated signees is different than 1"
        );
    }

    function testAddedSigneesSizeTwo() public {
        Sign sign = new Sign();
        sign.addSignee(docHash, dummyAddress);
        sign.addSignee(docHash, address(this));
        Assert.equal(
            sign.getAllSignees(address(this), docHash).length,
            2,
            "Amount of added signees is different than 2"
        );
    }

    function testAddedSigneeMatchesAddress() public {
        Sign sign = new Sign();
        sign.addSignee(docHash, dummyAddress);
        address[] memory signees = sign.getAllSignees(address(this), docHash);
        Assert.equal(
            signees[0],
            dummyAddress,
            "Amount of added signees is different than 1"
        );
    }

    function testDocumentIsUnsigned() public {
        Sign sign = new Sign();
        sign.addSignee(docHash, address(this));
        address[] memory signed = sign.getAllSigned(address(this), docHash);
        Assert.equal(
            signed.length,
            0,
            "Amount of confirmed signatures is different than 0"
        );
    }

    function testAmountDocumentSignatures() public {
        Sign sign = new Sign();
        sign.addSignee(docHash, address(this));
        sign.sign(address(this), docHash);
        address[] memory signed = sign.getAllSigned(address(this), docHash);
        Assert.equal(
            signed.length,
            1,
            "Amount of confirmed signatures is different than 1"
        );
    }

    function testDocumentSignatureMatches() public {
        Sign sign = new Sign();
        sign.addSignee(docHash, address(this));
        sign.sign(address(this), docHash);
        address[] memory signed = sign.getAllSigned(address(this), docHash);
        Assert.equal(
            signed[0],
            address(this),
            "Document signature address is different than signee's"
        );
    }
}
