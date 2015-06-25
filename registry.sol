contract registry {

  bytes32 movieName = MadMax;
  uint MAX_USERS;

  // Adresses of interested contracts
  mapping(address => address) interestedParties; // Mapping of user addresses to their contracts
  address[MAX_USERS] users; // This can be iterated through to get the info in the mapping. (user addrs)
  address[MAX_USERS] matchingUsers; // Users who match
  
  getMatches() { // Recursive function to find all matches for an event.
    checkMatchHelper(msg.sender, users[0], 0, 0);
  }

  getMatchesHelper(address caller, address match, uint usersIndex, uint matchIndex) {

    if(checkMatch(caller, match)) {
      matchingUsers[matchIndex] = match;
      matchIndex++;
    } 

    usersIndex++;
    if(usersIndex > MAX_USERS) {
      return;
    } else {
      getMatchesHelper(caller, users[usersIndex], usersIndex, matchIndex);
    }

  }

  checkMatch(address caller, address match) returns (bool) {

  }


}
