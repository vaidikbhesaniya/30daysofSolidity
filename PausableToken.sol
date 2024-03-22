// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PausableToken{

address public  owner;
bool public paused;
mapping (address=>uint) public balances;

constructor(){

    owner=msg.sender;
    paused=false;
    balances[owner]=1000;



}

modifier onlyowner(){
    require(msg.sender==owner,"you are not the owner");
    _;
}

modifier notpaused(){
    require(paused==false,"the contract is paused");
    _;
}


function pause() public onlyowner{
    paused=true;
}

function unpause() public onlyowner{
    paused=false;
}

function transfer(address to,uint amount) public notpaused {
    require(balances[msg.sender]>=amount,"insufficient balance");
    balances[msg.sender]-=amount;
    balances[to]+=amount;
}




}
