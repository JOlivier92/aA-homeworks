console.log('Hello from the JavaScript console!');

// Your AJAX request here
$.ajax({
      type: 'GET',
      url: "http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b",
      success(data) {
        console.log("We have your weather!")
        console.log(data);
      },
      error() {
        console.error("An error occurred.");
      },
   });
// Add another console log here, outside your AJAX request
console.log("where does this run???")
// When does the request get sent?
//  It gets sent immediately
// When does the response come back?
//  when the server responds to the request
// What's the current weather in New York?
//  temp: 294.01 wtf???
// Did the page refresh?
//  no
// How could we use different HTTP methods in our request?
//
