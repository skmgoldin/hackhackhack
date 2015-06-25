contract Interest {

  address userAddr;
  bytes32 name;
  address registry; // Registry contract
  uint idealTime;
  uint bribeTime;
  uint bribePrice;
  uint charity;

  function Interest() {
    userAddr = msg.sender;
  }

  function init(address registry, uint idealTime, uint bribeTime, uint bribePrice,
                uint charity) {
    registry = registry;
    idealTime = idealTime;
    bribeTime = bribeTime;
    bribePrice = bribePrice;
    charity = charity;
  }

  function getMatches() {
    /* Call the registry checkMatches function and set some variable (a bytes32?)
    with the names of matches. */
  }

  function getIdealTime() {
    return idealTime;
  }

  function getBribeTime() {
    return bribeTime;
  }

  function getBribePrice() {
    return bribePrice;
  }

  function getCharity() {
    return charity;
  }


}
