pragma solidity ^0.4.18;


pragma solidity ^0.4.18;


contract RevertSample {
  uint256 public counter;

  string public message;

  address public lib = 0x0;

  function RevertSample(address libaddr) {
    lib = libaddr;
  }

  function hoge() public {
    bytes4 sig = bytes4(keccak256("countup()"));
    address addr = lib;
    bool res = false;
    string memory resmsg = "";
    assembly {
    let freep := mload(0x40)
    let nextp := add(freep, 0x20) // 32byte 空ける
    mstore(0x40, nextp) // free memoryの場所を更新
    mstore(freep, mul(div(sig, 0x0100000000000000000000000000000000000000000000000000000000), 0x0100000000000000000000000000000000000000000000000000000000))
    res := call(sub(gas, 100000), addr, 0, freep, 0x04, freep, 0x40)
    returndatacopy(resmsg, 0x0, returndatasize)
    }
    if (!res) {
      message = resmsg;
    }
  }
}