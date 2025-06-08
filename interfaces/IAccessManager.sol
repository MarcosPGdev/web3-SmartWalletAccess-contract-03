// IAccessManager.sol
// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

interface IAccessManager {
    function approveContract(address _userWallet, address _newApproved, bool _approved) external;
    function isContractApproved(address _userWallet, address _newApproved) external view returns (bool);
}

