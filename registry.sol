contract registry {

  bytes32 movieName = MadMax;
  uint MAX_USERS;

  // Adresses of interested contracts
  mapping(address => address) interestedParties; // Mapping of user addresses to their contracts
  address[MAX_USERS] users; // This can be iterated through to get the info in the mapping. (user addrs)
  
  getMatches() { // Recursive function to find all matches for an event.
    checkMatchHelper(msg.sender, users[0], 0);
  }

  getMatchesHelper(address caller, address match, uint index) {
    

  }

  checkMatch(address caller, address match) returns (bool) {

  }


}
