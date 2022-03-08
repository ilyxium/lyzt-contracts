// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract whitelist is Ownable{

    //Address + how many spots they have to mint
    mapping(address => uint) public whitelist; 
    uint public wlLimit;
    uint public currentWLCount;
    uint public maxMintCount;

    constructor(uint _whitelistLimit, uint _maxMintCount) {
        wlLimit = _whitelistLimit;
        currentWLCount = 0;
        maxMintCount = _maxMintCount;
    }

    //get count of how many whitelist spots are taken
    function getCurrentWLCount() public view returns (uint) {
        return currentWLCount;
    }

    //get whitelist limit
    function getWLLimit() public view returns (uint) {
        return wlLimit;
    }

    //add a user manually to the whitelist, only by the person who deploys the contract
    function addToWLManually(address _address, uint mintCount) public onlyOwner returns (bool success) {
        require(whitelist[_address] > 0, "user is already on the whitelist!");
        require(currentWLCount < wlLimit - 1, "whitelist at capacity!");

        whitelist[_address] = mintCount;
        currentWLCount++;

        return true;
    }

    //add a normal user to the whitelist, with one mint
    function addToWL() public returns (bool success) {
        require(whitelist[msg.sender] > 0, "user is already on the whitelist!");
        require(currentWLCount < wlLimit - 1, "whitelist at capacity!");

        whitelist[msg.sender] = 1;
        currentWLCount++;

        return true;
    }

    //verify a user owns a collection of NFT's, and add that user to the whitelist
    

    //verify a user owns a number of NFT's, and add that user to the whitelist

    //add the holders of a collection to the whitelist
    function addCollectionHolders(address _collection) public returns (bool success) {
        //Get number of holders from collection
        //Check if WL limit is less than current + holderCount
        //If yes, map each address to the collection
        //Increment the count of users 
        //Return true
    }


    



}
