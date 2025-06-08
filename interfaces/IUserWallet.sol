// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

interface IUserWallet {
    function depositEther() external payable;
    function withdrawEther(uint256 _amount) external;
}