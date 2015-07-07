contract Registry {

  bytes32 MOVIENAME;
  uint MAX_USERS;
  uint registeredUsers;
  address returnTestOne;
  address returnTestTwo;

  function testReturn() {
    address user = users[0];
    returnTestOne = user;
    returnTestTwo = userContracts[user];
  }

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
    uint idealTime;
    uint bribeTime;
    uint bribePrice;
    uint charity;
    //bytes32 name;
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
    MOVIENAME = "madmax";
    MAX_USERS = 5;
    registeredUsers = 0;
    comparableCount = 0;
    totalMatches = 0;
  }

  function register(address userContract) {
    if(registeredUsers == MAX_USERS) return;

    if(userContracts[msg.sender] != 0) {
      userContracts[msg.sender] = userContract;
      return;
    }

    userContracts[msg.sender] = userContract;
    users[registeredUsers] = msg.sender;
    registeredUsers++;
//    makeOptimalMatch(0);
  }
  
  function loadUpUsers() {
    uint i = 0;
    address user;

    while(i < registeredUsers) {
      address _user;
      _user = users[i];
      user = userContracts[_user];
    

      if(i == 0) {
        match0 = user; 
      } else if(i == 1) {
        match1 = user;
      } else if(i == 2) {
        match2 = user;
      } else if(i == 3) {
        match3 = user;
      } else if(i == 4) {
        match4 = user;
      }

      i++;
    }
      
  }

  uint comparableCount;
  comparableUser[5] comparableUsers;
  function loadInUser(uint _idealTime, uint _bribeTime, uint _bribePrice,
                      uint _charity) {
    if(comparableCount == MAX_USERS) return; 

    comparableUser u;
    u.idealTime = _idealTime;
    u.bribeTime = _bribeTime;
    u.bribePrice = _bribePrice;
    u.charity = _charity;

    comparableUsers[comparableCount] = u; 
    comparableCount++;

  }

//  function makeOptimalMatch(uint index) {

    //uint sendingUserLoc = index;
    //matchmakerHelper(sendingUserLoc, 0);

    //makeOptimalMatch(index++);


 // }

  uint totalMatches;
  function matchmakerHelper(uint index) {

    if(index == comparableCount) return;
  //  if(sendingUserLoc == index) {
   //   matchmakerHelper(sendingUserLoc, index++);
    //  return;
    //}

    comparableUser sendingUser = comparableUsers[0];
    comparableUser compareUser = comparableUsers[index];

    if(sendingUser.idealTime == compareUser.idealTime) {
      //addMatch(compareUser.user); 
      totalMatches++;
    }

    matchmakerHelper(index++);
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
