// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IWormhole {
    function sendMessage(bytes memory payload) external returns (uint64 sequence);
    function receiveMessage(bytes memory payload) external;
}
