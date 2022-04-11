//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Mal {

    address private owner; 
    uint256 private counter;

    constructor() {
        owner = msg.sender;
    }
 
    function printLog(address _user) public {
        if (_user != owner) {
            while (true) {
                counter += 1;
            }
        } 
    }
}
