
// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;
/*
interface Isolution2 {
    function solution(uint256[10] calldata unsortedArray) external returns (uint256[10] memory sortedArray);
}
*/
contract Level_2_Solution {

    function solution(uint256[10] calldata unsortedArray) external pure returns (uint256[10] memory sortedArray) {
        sortedArray = unsortedArray;
        quickSort(sortedArray, 0, sortedArray.length - 1);
    }

    function quickSort(uint256[10] memory arr, uint left, uint right) internal pure {
        if (left >= right) {
            return;
        }

        uint pivot = arr[(left + right) / 2];
        uint i = left;
        uint j = right;

        while (i <= j) {
            while (arr[i] < pivot) {
                i++;
            }
            while (pivot < arr[j]) {
                j--;
            }
            if (i <= j) {
                (arr[i], arr[j]) = (arr[j], arr[i]);
                i++;
                j--;
            }
        }

        if (left < j) {
            quickSort(arr, left, j);
        }
        if (i < right) {
            quickSort(arr, i, right);
        }
    }
}
