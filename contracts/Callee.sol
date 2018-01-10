pragma solidity ^0.4.18;


contract Callee {
  uint256 public counter;

  function countup() public {
    counter = counter + 1;
    if (counter > 2) {
      string memory rmessage = "over count!";
      uint length = bytes(rmessage).length;
      assembly {
      //stringは最初の32byteにlength,次の32byteに文字列が入るので+0x20したものが全体のサイズになる
      revert(rmessage, add(length, 0x20))
      }
    }
  }

  function initcount() public {
    counter = 0;
  }
}
