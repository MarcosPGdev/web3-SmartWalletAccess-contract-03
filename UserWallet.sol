// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import "./interfaces/IAccessManager.sol";

contract UserWallet {

    //VARIABLES
    address public owner;
    IAccessManager public accessManager;

    //MODIFIERS

    modifier OnlyOwner(){
        require(owner == msg.sender, "You are not the owner");
        _;
    }

    modifier OnlyApproved(){
        require(accessManager.isContractApproved(address(this), tx.origin), "The sender does not have the required approval");
        _;
    }

    //EVENTS
    event Deposit(address _sender, uint256 _amount);
    event Withdraw(address _recipient, uint256 _amount);
    event ApprovedAddress(address _address);
    event RevokedAddress(address _address);

    //FUNCTIONS
    constructor (address _accessManager){
        owner = msg.sender;
        accessManager = IAccessManager(_accessManager);
    }

    function approveAddress(address _approveedAddress) public OnlyOwner {
        accessManager.approveContract(address(this), _approveedAddress, true);
        emit ApprovedAddress(_approveedAddress);
    }


    function revokeApproval(address _approveedAddress) public OnlyOwner {
        accessManager.approveContract(address(this), _approveedAddress, false);
        emit RevokedAddress(_approveedAddress);
    }

    function depositEther() external payable {
        emit Deposit(tx.origin, msg.value);
    }

    function withdrawEther(uint256 _amount) external OnlyApproved{
        (bool success,) = tx.origin.call{value:_amount}("");
        require(success, "Withdraw error");
        emit Withdraw(tx.origin, _amount);
    }

    receive() external payable {
        require(msg.value > 0, "No ETH sent");
        emit Deposit(tx.origin, msg.value);
    }

    fallback() external payable {
        require(msg.value > 0, "Fallback called without value");
        emit Deposit(tx.origin, msg.value);
    }
}