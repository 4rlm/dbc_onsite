var responseOptions = {
  empty:     ["Go on. I'm listening.", "Don't be shy. Let's hear it.", "How can I help you?", "Did you want to ask something?", "Something on your mind?", "Well ... ?"],
  statement: ["Is that a question?", "I can only answer questions."],
  repeat:    ["I already told you.", "You're asking that again?", "I've given you my answer.", "No repeat questions."],
  question:  ["How would I know?", "Aah, flip a coin.", "That's up to you.", "Yes, no ... maybe?", "I have no earthly idea.", "Signs point ... somewhere.", "Yeah, that's a tough one.", "My sources are unavailable.", "You don't want my advice on that."]
};

var empty = function(question) {
  return question === "";
}

var newQuestion = function(question) {
  return questionType(question) === "question" && !(previouslyAnswered(question));
}

var noQuestionMarkAtEnd = function(question) {
  return !(questionMarkAtEnd(question));
}

var getQuestion = function() {
  return $("#question").val().trim();
};

var questionMarkAtEnd = function(question) {
  return /\?$/.test(question);
}

var questionType = function(question) {
  if(empty(question))               return "empty";
  if(noQuestionMarkAtEnd(question)) return "statement";
  if(previouslyAnswered(question))  return "repeat";

  return "question";
};

var recordAsAnswered = function(question) {
  if(newQuestion(question)) answeredQuestions.push(question);
};

var previouslyAnswered = function(question) {
  return answeredQuestions.includes(question);
}

var respondToQuestion = function() {
  var question = getQuestion();
  var response = responseFor(question);

  updateAnswer(response);
  recordAsAnswered(question);
};

var responseFor = function(question) {
  var typeOfQuestion  = questionType(question);
  var responseOptions = responseOptionsFor(typeOfQuestion);

  return sampleOne(responseOptions);
};

var responseOptionsFor = function(typeOfQuestion) {
  return responseOptions[typeOfQuestion];
}

var sampleOne = function(items) {
  return items[Math.floor(Math.random() * items.length)]
};

var updateAnswer = function(response) {
  $("#answer").fadeOut(600, function() {
    setTimeout(function() {
      $("#answer").text(response).fadeIn(600);
    }, 400);
  });
};


$(document).ready(function() {
  $("#ask-button").on("click", respondToQuestion);
});
