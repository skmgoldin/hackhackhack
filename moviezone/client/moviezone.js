Router.route('/', function () {
  this.render('wallet');
});

Template.wallet.rendered = function (){
var faucetCode = "60606040525b33600060006101000a81548173ffffffffffffffffffffffffffffffffffffffff0219169083021790555060006001600050819055505b61013a8061004b6000396000f30060606040526000357c0100000000000000000000000000000000000000000000000000000000900480637d228c7714610044578063e942c5641461005157610042565b005b61004f6004506100ce565b005b610062600480359060200150610064565b005b3073ffffffffffffffffffffffffffffffffffffffff1631811115156100ca578060016000828282505403925050819055503373ffffffffffffffffffffffffffffffffffffffff16600082604051809050600060405180830381858888f19350505050505b5b50565b600060009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff161415610137573460016000828282505401925050819055505b5b56"
  var faucetABI = '[{"constant":false,"inputs":[],"name":"fillPool","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"value","type":"uint256"}],"name":"getWei","outputs":[],"type":"function"},{"inputs":[],"type":"constructor"}]'
  var api;
  var keystore;
  var helpers = ethlightjs.helpers;
  var password;
  var seed;

  $("#getAddrs").click(function getAddrs() {    
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

  });

  function checkNonce(callback) {
    var addr = document.getElementById("address").value;
    var nonce = api.getNonce(addr, callback) ;
  };

 
  function publishContract(err, nonce) {
    console.log(nonce);
    var fromAddr = document.getElementById("address").value;
    var txObj = {gaslimit: 30000, nonce: nonce};
    helpers.sendCreateContractTx(faucetCode, fromAddr, txObj, api, keystore, password, function(err, contractAddr) {
      document.getElementById("contractAddr").value = contractAddr;
    })
  }
  $("#publishContract").click(checkNonce(publishContract));
  
  $("#sendEth").click(function sendEth(err, nonce) {
    
    var amount = parseInt(document.getElementById("amount").value);
    var contractAddr = document.getElementById("contractAddr").value;
    var fromAddr = document.getElementById("address").value;
    var txData = {gasLimit:3141592, gasPrice:100, value: amount, nonce: nonce};
    helpers.sendFunctionTx(faucetABI, contractAddr, "fillPool", [], fromAddr, txData, api, keystore, password);
  });


};

Template['movieSelect'].events({
    'click button.select': function (e, template) {
        var movie = ''; 
        if (template.find('select').value == 'event1'){
          movie = 'madmax';
        }
        //movieContract.setMovie(movie, {from: web3.eth.accounts[0], gas: 50000});      
    }
});
Template['makePlan'].events({
    'click button.select': function (e, template) {
        //alert('tip is '+ GuessNumberInstance.get());
        //alert(template.find('tip2').value);
	var d1 = new Date();
       	var d2 = new Date();
	var d3 = new Date();
	var t1 = new Date('June 25, 2015 16:00:00');
        var t2 = new Date('June 25, 2015 18:00:00');
        var t3 = new Date('June 25, 2015 20:00:00');
        console.log(template.findAll('input')[2].value == "time1");
        if (template.findAll('input')[1].value == "time1"){
	    d1 = t1;
	}
        if (template.findAll('input')[3].value == "time2"){
	    d2 = t2;
	}
        if (template.findAll('input')[5].value == "time3"){
	    d3 = t3;
	}
        alert('name is ' + template.findAll('input')[0].value);
        alert('Tip for '+ d1 + ' is ' + template.findAll('input')[2].value);
        alert('Tip for '+ d2 + ' is ' + template.findAll('input')[4].value);
        alert('Tip for '+ d3 + ' is ' + template.findAll('input')[6].value);
    }
});

