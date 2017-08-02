var tweets = [{text: "Wow this JS thing is so much fun!", user:"srossblack"}, {text:"HTML, CSS, JavaScript and Ruby... put them all together in our intro to full stack web development in NYC", user:"devbootcamp"}, {text:"Weak inflation may mean that the Fed's next interest rate rise is delayed", user:"TheEconomist"}, {text:"Brutally honest accounts of the most painful tattoo spots", user:"mashable"},{text:"Save 10% Off Today's Deal - Shop Now!", user:"amazon"}, {text:"The rich and powerful are going crazy over these luxury SUVs with bathrooms", user: "businessinsider"}, {text: "'Change is the essence of life; be willing to surrender what you are for what you could become.' —Reinhold Niebuhr", user: "srossblack"}, {text:"Good news for tech professionals - the unemployment rate in the sector averaged just 2.1% in the second quarter", user:"Forbes"},{text:"Anyone can learn to code. :)", user:"nickrp"}];

var x = "test",
    y = "hello";

$(document).ready(function(){
  // Any code within this function will run as soon as your page has loaded.
  console.log("loaded");

  $("#load-tweets-button").on('click', function() {
    console.log("clicked");
    var button = $(this);

    // if (!button.hasClass('clicked')) {
    //     button.addClass("clicked");
    //     for(var i=0; i < tweets.length; i++) {
    //         var tweet = tweets[i];
    //         var html = "<p>" + tweet['text'] + "- " + tweet['user'] + "</p>";
    //         $("#main-container").append(html);
    //     }
    // }
    if (tweets.length > 0) {
        var tweet = tweets.pop();
        var html = "<p>" + tweet['text'] + "- " + tweet['user'] + "</p>";
        $("#main-container p").before(html);
        // $($("#main-container").find('p').last()).slideDown();
        // console.log();
    }

  });

});
