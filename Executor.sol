// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import "./interfaces/IUserWallet.sol";

contract Executor {
    function deposit(address _wallet) external payable {
        IUserWallet(_wallet).depositEther{value: msg.value}();
    }

    function withdraw(address _wallet, uint256 amount) external {
        IUserWallet(_wallet).withdrawEther(amount);
    }
}
