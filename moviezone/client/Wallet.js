  var faucetCode = "60606040525b33600060006101000a81548173ffffffffffffffffffffffffffffffffffffffff0219169083021790555060006001600050819055505b61013a8061004b6000396000f30060606040526000357c0100000000000000000000000000000000000000000000000000000000900480637d228c7714610044578063e942c5641461005157610042565b005b61004f6004506100ce565b005b610062600480359060200150610064565b005b3073ffffffffffffffffffffffffffffffffffffffff1631811115156100ca578060016000828282505403925050819055503373ffffffffffffffffffffffffffffffffffffffff16600082604051809050600060405180830381858888f19350505050505b5b50565b600060009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff161415610137573460016000828282505401925050819055505b5b56"
  var faucetABI = '[{"constant":false,"inputs":[],"name":"fillPool","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"value","type":"uint256"}],"name":"getWei","outputs":[],"type":"function"},{"inputs":[],"type":"constructor"}]'
  var api;
  var keystore;
  var helpers = ethlightjs.helpers
  var password;
  var seed;

  function getAddrs() {
    seed = document.getElementById("seed").value;
    password = document.getElementById("password").value;
    api = new ethlightjs.blockchainapi.blockappsapi("http://stablenet.blockapps.net")
    keystore = new ethlightjs.keystore(seed, password);

    var addr0 = keystore.generateNewAddress(password);
    var bal0 = api.getBalance(addr0, function(err, bal) {
        document.getElementById("addr0").innerHTML = addr0 + " (" + (bal / 1.0e18) + " ETH)";
    })
    var addr1 = keystore.generateNewAddress(password);
    var bal1 = api.getBalance(addr1, function(err, bal) {
        document.getElementById("addr1").innerHTML = addr1 + " (" + (bal / 1.0e18) + " ETH)";
    })

  }

  function checkNonce(callback) {
    var addr = document.getElementById("address").value;
    var nonce = api.getNonce(addr, callback) 
  }

  function publishContract(err, nonce) {
    console.log(nonce);
    var fromAddr = document.getElementById("address").value;
    var txObj = {gaslimit: 30000, nonce: nonce};
    helpers.sendCreateContractTx(faucetCode, fromAddr, txObj, api, keystore, password, function(err, contractAddr) {
      document.getElementById("contractAddr").value = contractAddr;
    })
  }

  function sendEth(err, nonce) {
    var amount = document.getElementById("amount").value;
    var contractAddr = document.getElementById("contractAddr").value;
    var fromAddr = document.getElementById("address").value;
    var txData = {value: amount, nonce: nonce};
    var callback = function(undefined, undefined){}
    helpers.sendFunctionTx(faucetABI, contractAddr, "fillPool", [], fromAddr, txData, api, keystore, password, callback)
  }
