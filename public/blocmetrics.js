
var blocmetrics = {};
  
  blocmetrics.report = function(about){
  // your code here

  blocmetrics.report = function(event_name: "about") {
    var request = new XMLHttpRequest();
    request.open("POST", "http://localhost:3000/api/events.json", true);
    request.setRequestHeader('Content-Type', 'application/json');
    
    request.onreadystatechange = function() {
      // this function runs when the Ajax request changes state.
    };
    request.send(JSON.stringify({name: about));
  }
};