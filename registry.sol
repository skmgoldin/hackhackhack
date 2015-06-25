contract Registry {

  bytes32 MOVIENAME = "MADMAX";
  uint MAX_USERS = 5;
  uint registeredUsers;

  mapping(address => address) userContracts; // Mapping of user addresses to their contracts
  address[5] users;                          /* This can be iterated through to call methods
                                                for all contracts in userContracts */

  /* BA query variables for getting user contract data for loadInUser(...) */
  address userContract0;
  address userContract1;
  address userContract2;
  address userContract3;
  address userContract4;

  struct comparableUser {
    address user;
    uint idealTime;
    uint bribeTime;
    uint bribePrice;
    uint charity;
    bytes32 name;
  }


  /* BA query variables for users who match an event wanted by a given address.
     Make sure to zero these out after use!! */
  address match0;
  address match1;
  address match2;
  address match3;
  address match4;
  uint matchTime;
  

  /* Constructor */
  function Registry() {
    registeredUsers = 0;
    comparableCount = 0;
  }

  function register(address userContract) {
    if(registeredUsers == MAX_USERS) return;

    userContracts[msg.sender] = userContract;
    users[registeredUsers] = msg.sender;
    registeredUsers++;
    makeOptimalMatch(0);
  }
  
  uint comparableCount;
  comparableUser[5] comparableUsers;
  function loadInUser(address _user, uint _idealTime, uint _bribeTime,
                      uint _bribePrice, uint _charity, bytes32 _name) {
    if(comparableCount == MAX_USERS) return; 

    comparableUser u;
    u.user = _user;
    u.idealTime = _idealTime;
    u.bribeTime = _bribeTime;
    u.bribePrice = _bribePrice;
    u.charity = _charity;
    u.name = _name;

    comparableUsers[comparableCount] = u; 
    comparableCount++;

  }

  function makeOptimalMatch(uint index) {

    if(comparableUsers[index].user == msg.sender) {
      uint sendingUserLoc = index;
      matchmakerHelper(sendingUserLoc, 0);
      return;
    }

    makeOptimalMatch(index++);

  }

  function matchmakerHelper(uint sendingUserLoc, uint index) {

    if(index == comparableCount) return;
    if(sendingUserLoc == index) {
      matchmakerHelper(sendingUserLoc, index++);
      return;
    }

    comparableUser sendingUser = comparableUsers[sendingUserLoc];
    comparableUser compareUser = comparableUsers[index];

    if(sendingUser.idealTime == compareUser.idealTime) {
      addMatch(compareUser.user); 
    }

    matchmakerHelper(sendingUserLoc, index++);
    return;
  }

  function addMatch(address user) {
    if(match0 == 0) match0 = user;
    else if(match1 == 0) match1 = user;
    else if(match2 == 0) match2 = user;
    else if(match3 == 0) match3 = user;
    else if(match4 == 0) match4 = user;
  }

}
