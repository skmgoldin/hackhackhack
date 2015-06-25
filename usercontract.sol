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

    if(msg.sender != user || msg.value != _charity) return;

    idealTime = _idealTime;
    bribeTime = _bribeTime;
    bribePrice = _bribePrice;
    charity = _charity;
    name = _name;

  }

}
