// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract Twitter{

uint public Mx_length=100;

struct Tweet{
   address author;
   string content;
   uint256 timestamp;
   uint256 likes;
}
address public owner;
constructor(){
owner=msg.sender;
}

modifier onlyowner(){
   require(  msg.sender==owner,"you are not the owner");
   _;
}

 mapping(address => Tweet[]) public tweets;



function changelength(uint newlength)public onlyowner {

   Mx_length=newlength;

}


 function createTweet(string memory _tweet) public{


require(bytes(_tweet).length<=Mx_length,"pleasee enter vald statement");
   Tweet memory newTweet=Tweet({
      author:msg.sender,
      content:_tweet,
      timestamp:block.timestamp,
      likes:0
   });
    tweets[msg.sender].push(newTweet);
 }
 function getTweet(uint256 index) public view  returns (Tweet memory) {
return tweets[msg.sender][index];
 }

 function getAllTweet(address _owner) public view returns (Tweet[] memory ){
   return  tweets[_owner];
 }
}