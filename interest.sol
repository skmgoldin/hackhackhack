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


}
