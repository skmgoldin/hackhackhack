contract UserContract {

  address user;
  uint idealTime;
  uint bribeTime;
  uint bribePrice;
  uint charity;
  bytes32 name;

  function UserContract() {
    user = msg.sender;
  }

  function init(uint _idealTime, uint _bribeTime, uint _bribePrice, 
                uint _charity, bytes32 _name) {

    if(msg.sender != userAddr || msg.value != _charity) return;

    idealTime = _idealTime;
    bribeTime = _bribeTime;
    bribePrice = _bribePrice;
    charity = _charity;
    name = _name;

  }

  function getMatches() {
    //address[] matches = registry.call("getMatches");
    //setNames(matches);
  }

  function setNames(address[] matches) {
    uint index = 0; // THIS SHOULD BE INPUT RECURSIVELY
    if(matches[index] != 0) {
      address ratch = matches[index];  
   /*   matchingParties = ratch.call("getName");  /* HAHAHAHAHA THIS IS ONLY GONNA RETURN ONE NAME
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
