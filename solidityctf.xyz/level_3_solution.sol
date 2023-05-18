// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

/*
interface Isolution {
    function solution(address addr) external view returns (uint256 codeSize);
}
*/

contract Level_3_Solution {
        
    function solution(address addr) external view returns (uint256 codeSize) {
        
            assembly {
                codeSize := extcodesize(addr)

    }
    
    }
}