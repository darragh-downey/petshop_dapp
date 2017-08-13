pragma solidity ^0.4.4;

contract Adoption {
  address[16] public adopters;

  function adopt(uint petId) public returns (uint) {
    // range check
    require(petId >= 0 && petId <= 15);
  
    // add the address of the person who made the call to the adopters array
    // for petId
    adopters[petId] = msg.sender;

    return petId;
  }

  function getAdopters() public returns (address[16]) {
    return adopters;
  }

}
