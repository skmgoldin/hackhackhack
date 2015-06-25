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
  }

  function getMatches() returns (address[100]) { // Recursive function to find all matches for an event.
    User userContract = userContracts[msg.sender];
    getMatchesHelper(msg.sender, users[0], 0, 0);
    return matchingUsers;
  }

  function getMatchesHelper(address caller, address ratch, uint usersIndex, uint matchIndex) {

    if(checkMatch(caller, userContracts[ratch])) {
      matchingUsers[matchIndex] = ratch;
      matchIndex++;
    } 

    usersIndex++;
    if(usersIndex > MAX_USERS) {
      return;
    } else {
      getMatchesHelper(caller, users[usersIndex], usersIndex, matchIndex);
    }

  }

  function checkMatch(address caller, address ratch) returns (bool) {
    /* Ideal times match */
    if(caller.call("getIdealTime") == ratch.call("getIdealTime")) {
      return true;
    }

    /* idealTime-bribeTime overlap LETS JUST TEST IDEAL MATCH FIRST */
 //   if(caller.call("getIdealTime") == match.call("getBribeTime") ||
 //      caller.call("getBribeTime") {
      
  }

}
