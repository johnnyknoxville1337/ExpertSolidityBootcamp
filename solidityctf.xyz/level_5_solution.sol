// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;
/*
interface Isolution5 {
    function solution(bytes32 b, bytes32 ex, bytes32 modulus) external returns (bytes32 result);
}
*/
contract Level_5_Solution {
        
    function solution(bytes32 b, bytes32 ex, bytes32 modulus) external 
    returns (bytes32 result) {
        uint256 base = uint256(b);
        uint256 exponent = uint256(ex);
        uint256 mode = uint256(modulus);

        assembly {
            // Free memory pointer
            let pointer := mload(0x40)

            // Define length of base, exponent and modulus. 0x20 == 32 bytes
            mstore(pointer, 0x20)
            mstore(add(pointer, 0x20), 0x20)
            mstore(add(pointer, 0x40), 0x20)

            // Define variables base, exponent and modulus
            mstore(add(pointer, 0x60), base)
            mstore(add(pointer, 0x80), exponent)
            mstore(add(pointer, 0xa0), mode)

            // Store the result
            let value := mload(0xc0)

            // Call the precompiled contract 0x05 = bigModExp
            if iszero(call(not(0), 0x05, 0, pointer, 0xc0, value, 0x20)) {
                revert(0, 0)
            }

            result := mload(value)
        }
    }
}
