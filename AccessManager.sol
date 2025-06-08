// SPDX-License-Identifier: MIT


pragma solidity 0.8.24;


contract AccessManager {
    address public admin;

    mapping(address => mapping(address => bool)) public isApproved;

    modifier onlyEOA() {
        require(tx.origin == admin, "Only EOA allowed");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function approveContract(address _userWallet, address _newApproved, bool _approved) external onlyEOA {
        isApproved[_userWallet][_newApproved] = _approved;
    }

    function isContractApproved(address _userWallet, address _approvedWallet) external view returns (bool) {
        return isApproved[_userWallet][_approvedWallet];
    }
}