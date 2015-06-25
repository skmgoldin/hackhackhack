contract Registry {

  bytes32 MOVIENAME = "MADMAX";
  uint MAX_USERS = 100;
  uint registeredUsers;

  mapping(address => address) userContracts; // Mapping of user addresses to their contracts
  address[100] users;                        /* This can be iterated through to call methods
                                                for all contracts in userContracts */

  /* Query variables for users who match an event wanted by a given address.
     Make sure to zero these out after use!! */
  address match0;
  address match1;
  address match2;
  address match3;
  address match4;
  

  /* Constructor */
  function Registry() {
    registeredUsers = 0;
  }

  function register(address userContract) {
    userContracts[msg.sender] = userContract;
    registeredUsers++;
    makeOptimalMatch();
  }

  function makeOptimalMatch() {
     
  }

}
