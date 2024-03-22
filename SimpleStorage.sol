// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract SimpleStorage{

struct Person{
    uint favoriteNumber;
    string name;
}

Person public person1= Person(7,"vaidik");



uint public  favoriteNumber=15;

 
function store(uint _favoriteNumber) public {

    favoriteNumber=_favoriteNumber;
}
    
}