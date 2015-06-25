contract Registry {

  bytes32 MOVIENAME = "madMax";
  uint MAX_USERS = 100;
  uint registeredUsers;

  mapping(address => User) userContracts; // Mapping of user addresses to their contracts
  address[100] users;                      /* This can be iterated through to get the info in
                                                    the mapping. (user addrs) */
  address[100] matchingUsers;              // Users who match
  

  /* Constructor */
  function Registry() {
    registeredUsers = 0;
  }

  function init(uint _idealTime, uint _bribeTime, uint _bribePrice,
                uint _charity, bytes32 _name) {

    userContracts[msg.sender] = User(msg.sender);
    userContracts[msg.sender].init(_idealTime, _bribeTime,
                                       _bribePrice, _charity, _name);
    users[registeredUsers] = msg.sender;
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

/* ===================================================== */

contract User {

  address userAddr;
  bytes32 name;
  uint idealTime;
  uint bribeTime;
  uint bribePrice;
  uint charity;

  bytes32 matchingParties;

  function User() {
    userAddr = msg.sender;
  }

  function init(uint _idealTime, uint _bribeTime, uint _bribePrice, 
                uint _charity, bytes32 _name) {

    if(msg.sender != userAddr) return;

    idealTime = _idealTime;
    bribeTime = _bribeTime;
    bribePrice = _bribePrice;
    charity = _charity;
    name = _name;

    //registry.call("register", address(this));
  }

  function getMatches() {
    //address[] matches = registry.call("getMatches");
    //setNames(matches);
  }

  function setNames(address[] matches) {
    uint index = 0; // THIS SHOULD BE INPUT RECURSIVELY
    if(matches[index] != 0) {
      address ratch = matches[index];  
      matchingParties = ratch.call("getName");  /* HAHAHAHAHA THIS IS ONLY GONNA RETURN ONE NAME
                                                     matchingParties needs to be queried, if I can
                                                     get one name out I'm happy. */
    }
  }

  function getIdealTime() returns (uint) {
    return idealTime;
  }

  function getBribeTime() returns (uint) {
    return bribeTime;
  }

  function getBribePrice() returns (uint) { 
    return bribePrice;
  }

  function getCharity() returns (uint) {
    return charity;
  }

  function getName() returns (bytes32) {
    return name;
  }

}
