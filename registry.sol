contract Registry {

  bytes32 MOVIENAME = "MADMAX";
  uint MAX_USERS = 5;
  uint registeredUsers;

  mapping(address => address) userContracts; // Mapping of user addresses to their contracts
  address[5] users;                          /* This can be iterated through to call methods
                                                for all contracts in userContracts */

  struct user {
    address user;
    uint idealTime;
    uint bribeTime;
    uint bribePrice;
    uint charity;
    bytes32 name;
  }

  user user0;
  user user1;
  user user2;
  user user3;
  user user4;

  /* Query variables for users who match an event wanted by a given address.
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
  }

  function register(address userContract) {
    if(registeredUsers == MAX_USERS) return;

    userContracts[msg.sender] = userContract;
    users[registeredUsers] = msg.sender;
    registeredUsers++;
    makeOptimalMatch();
  }

  function loadInUser(uint _idealTime, uint _bribeTime, uint _bribePrice,
                      uint _charity, bytes32 _name) {
    
  }

  function makeOptimalMatch() {
     
  }

}
