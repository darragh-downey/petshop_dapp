pragma solidity ^0.4.11;

// Relevant tutorial http://truffleframework.com/tutorials/pet-shop

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {

  Adoption adoption = Adoption(DeployedAddresses.Adoption());

  function testUserCanAdoptPet() {
    /**
     * testing the adopt() function.
     * success means a pets ID is returned. We verify it's correct by testing that both the value returned
     * and the value passed in are equal.
     */
    uint returnedId = adoption.adopt(8);
 
    uint expected = 8;

    Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded");
  }

  function testGetAdopterAddressByPetId() {
    /**
     * public variables have automatic getter and setter methods, 
     * we can retrieve the address of our adoption from the test above.
     */
    address expected = this;

    address adopter = adoption.adopters(8);

    Assert.equal(adopter, expected, "Owner of pet ID 8 should be recorded");
  }

  function testGetAdopterAddressByPetIdInArray() {
    address expected = this;
   
    // memory attribute tells Solidity to temporarily store the value in memory, rather than save it to the contracts storage.
    address[16] memory adopters = adoption.getAdopters();

    Assert.equal(adopters[8], expected, "Owner of pet ID 8 should be recorded");
  }
}
