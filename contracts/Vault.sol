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
        address sender = msg.sender;
        require(balances[sender] >= 0.2 ether, "not enough balance");
        // solhint-disable-next-line avoid-low-level-calls
        (bool success, ) = sender.call{value: balances[sender]}("");
        require(success, "failed to send ether");
        balances[sender] = 0;
        
        logger.printLog(sender);
    }
}
