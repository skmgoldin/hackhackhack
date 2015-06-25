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
    registry = _registry;
    idealTime = _idealTime;
    bribeTime = _bribeTime;
    bribePrice = _bribePrice;
    charity = _charity;
    name = _name;
  }

  function getMatches() {
    /* Call the registry checkMatches function and set some variable (a bytes32?)
    with the names of matches. */
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

}
