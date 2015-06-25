contract Interest {

  address userAddr;
  bytes32 name;
  address registry; // Registry contract
  uint idealTime;
  uint bribeTime;
  uint bribePrice;
  uint charity;

  bytes32 matchingParties;

  function Interest() {
    userAddr = msg.sender;
  }

  function init(address _registry, uint _idealTime, uint _bribeTime,
                uint _bribePrice, uint _charity, bytes32 _name) {

    if(msg.sender != userAddr) return;

    registry = _registry;
    idealTime = _idealTime;
    bribeTime = _bribeTime;
    bribePrice = _bribePrice;
    charity = _charity;
    name = _name;

    registry.call("register", address(this));
  }

  function getMatches() {
    address[] matches = registry.call("getMatches");
    setNames(matches);
  }

  function setNames(address[] matches) {
    if(matches[index] != 0) {
      address match = matches[index];  
      matchingParties = match.call("getName");  /* HAHAHAHAHA THIS IS ONLY GONNA RETURN ONE NAME
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
