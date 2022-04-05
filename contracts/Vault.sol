//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Logs {

    event Withdraw(address indexed user);

    function printLog(address _user) public {
        emit Withdraw(_user);
    }
}

contract SimpleStorage {
    
    Logs private logger;
    mapping(address => uint256) public balances;

    constructor(address _logger) {
        logger = Logs(_logger);
    }

    receive() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        require(balances[msg.sender] >= 0.2 ether, "not enough balance");
        logger.printLog(msg.sender);
        // solhint-disable-next-line avoid-low-level-calls
        (bool success, ) = msg.sender.call{value: balances[msg.sender]}("");
        require(success, "failed to send ether");
        balances[msg.sender] = 0;
    }
}
