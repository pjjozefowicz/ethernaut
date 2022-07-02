//SPDX-License-Identifier: Unlicense
pragma solidity ^0.6.0;

contract SelfDestruct {

    //put instance address here
    address beneficiary = 0xec9A877f1D5FFE95F8a13c6E08488F8BFC61A26e;

    function destroyMe() public {
        selfdestruct(payable(beneficiary));
    }

    function balance() public view returns (uint) {
        return address(this).balance;
    }

    receive() payable external {}
}
