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

