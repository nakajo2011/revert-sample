pragma solidity ^0.4.18;


contract Callee {
  uint256 public counter;

  function countup() {
    counter = counter + 1;
    if (counter > 2) {
      string memory msg = "over count!";
      uint length = bytes(msg).length;
      assembly {
      //stringは最初の32byteにlength,次の32byteに文字列が入るので+0x20したものが全体のサイズになる
      revert(msg, add(length, 0x20))
      }
    }
  }

  function initcount() {
    counter = 0;
  }
}
