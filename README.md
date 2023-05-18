# ExpertSolidityBootcamp

[solidityctf.xyz](solidityctf.xyz)  

# Tutorial
For each level you will be asked to write a smart contract based on the given interface. You are free to write the solution as you see fit as long as your contract adheres to the contract interface. In practice this means, for most levels, you will be given an empty function and asked to write the logic. Once you have written your solution you will need to deploy the contract and submit the address to receive a score.

You can submit as many times as you like. The contract will save your max score with the lowest gas.

# Level 0 - Return 42 (tutorial)
This level is really simple. Use the interface bellow to write a smart contract. Your contract should contain a function called solution that returns a uint8. In this case the function body logic is very simply as the answer is always 42.

# Level 1 - Matrix Addition
Write a function that adds two matrices returns the result. To keep things simple the array sizes will be fixed sizes of 2x2 (uint256[2][2]). Take a look at Wikipedia if you need help understanding matrix addition. Your solution should implement the following interface:

```
interface Isolution1 {
    function solution(
        uint256[2][2] calldata x, 
        uint256[2][2] calldata y
    ) external pure returns (
        uint256[2][2] memory
    );
}
```

# Level 2 - Sorting an Array
Write a function that sorts an array in ascending order and returns the result. The array will be a fixed of 10 but the contents random. Your solution should implement the following interface:

```
interface Isolution2 {
  function solution(uint256[10] calldata unsortedArray) external returns (uint256[10] memory sortedArray);
}
```

# Level 3 - codeSize
Using the Isolution3 interface write a function that takes an address and returns the codeSize of that address as a uint256.

```
interface Isolution3 {
    function solution(address addr) external view 
    returns (uint256 codeSize);
}
```

# Level 4 - Storage
Using the Isolution4 interface write a function that takes a uint256 and saves it to storage slot 3.

```
interface Isolution4 {
    function solution(uint256 value) external;
}
```

# Level 5 - Modular Exponentiation
Using the Isolution5 interface calculate Modular Exponentiation (base**exp % mod). Implementing it from scratch would take too much gas so you will need to use the precompiled contract at address 0x05

```
interface Isolution5 {
    function solution(
        bytes32 b,
        bytes32 ex, 
        bytes32 mod) 
    external returns (
        bytes32 result
    );

}
```

# Level 6 - Verifying Signatures
For this level we signed some messages off chain using the following front end code:
const ethers = require('ethers');

let messageHash = ethers.utils.id("bidPrice(0.420)");
let messageHashBytes = ethers.utils.arrayify(messageHash);
let flatSig = await wallet.signMessage(messageHashBytes); // Sign the binary data
let sig = ethers.utils.splitSignature(flatSig);  // sig.v sig.r sig.s etc
Using the Isolution6 interface write a function that will take the messageHash (plus params) and return the signer of the message.

Hint: Don't forget to prepend your message with “\x19Ethereum Signed Message:\n32”

```
interface Isolution6 {
    function solution(
      bytes32 messageHash, 
      uint8 v, 
      bytes32 r, 
      bytes32 s
      ) external pure 
    returns (address signer);
}
```
