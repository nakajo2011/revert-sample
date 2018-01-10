pragma solidity ^0.4.18;


contract RevertSample {
  uint256 public counter;

  string public message;

  address public lib = 0x0;

  function RevertSample(address libaddr) public {
    lib = libaddr;
  }

  function hoge() public {
    string memory resmsg = "";
    message = resmsg;
    if (!lib.call(bytes4(keccak256("countup()")))) {
      assembly {
      let rdatasize := returndatasize
      returndatacopy(resmsg, 0x0, rdatasize)
      mstore(0x40, add(rdatasize, resmsg)) // free pointerを更新
      }
      message = resmsg;
    }
  }
}