var questions;
var answers;
var questionIndex;

$(document).ready(function () {
	
	//test quiz
	questions = [
		{text: "First question", answers: ["first","second","third","fourth"], subject: "Life"},
		{text: "Second question", answers: ["eeney","meeney","miney","moe"], subject: "Money"},
		{text: "Question, the third", answers: ["herp","derp","herp derp","herp derp derp"], subject: "Money"},
		{text: "FINAL QUESTION: THIS IS FOR ALL THE MARBLES", answers: ["(>'-')>","<( '-' )>","<('-'<)","<( ^-^ )>"], subject: "Rock and Roll"}
	];
		
		
	
	answers = [];
	questionIndex = 0;
	startQuiz();
	
	
	
	$("#nextQuestionButton").click(function () {
		if ($(this).hasClass("disabled")) {
			return;
		}
		
		//save the user's answer
		if (questionIndex >= answers.length) {
			answers.push($("#questionAnswers").find("input:checked").val());
		}
		else {
			answers[questionIndex] = $("#questionAnswers").find("input:checked").val();
		}
		
		if (questionIndex == questions.length - 1) {
			finishQuiz();
		}
		
		else {
			//load the next question
			questionIndex++;
			
			$("#questionText").text(questions[questionIndex].text);
			
			$("#questionAnswers").find("label").each(function (i) {
				$(this).text(questions[questionIndex].answers[i]);
			});
			
			$(".questionNumber").text(questionIndex + 1);
			
			if (questionIndex >= answers.length) {
				$("#questionAnswers").find("input:checked").removeAttr("checked");
				
				//increase the quiz progress
				$(".progressPercent").text(Math.round(100 / questions.length * questionIndex));
				$("#progressBar > div").css("width", Math.round(100 / questions.length * questionIndex) + "%");
			}
			else {
				$("#questionAnswers").find("input").eq(answers[questionIndex]).attr("checked", "checked");
			}
			
			//adjust the current subject if neccesary
			if (questions[questionIndex].subject != $("#quizSubjects").find(".currSubject").text()) {
				$("#quizSubjects").find(".currSubject").removeClass("currSubject").addClass("complete");
				$("#quizSubjects").find(".subjectLabel").each( function() {
					if ($(this).text() == questions[questionIndex].subject) {
						$(this).addClass("currSubject");
					}
				});
			}
			
			//enable/disable the buttons
			$("#prevQuestionButton").removeClass("disabled");
			if (questionIndex >= answers.length) {
				$("#nextQuestionButton").addClass("disabled");
			}
			
			if (questionIndex == questions.length - 1) {
				$("#nextQuestionButton").text("Finish");
			}
		}
	});
	
	
	
	$("#prevQuestionButton").click(function () {
		if ($(this).hasClass("disabled")) {
			return;
		}
		
		if (questionIndex == questions.length - 1) {
			$("#nextQuestionButton").text("Next");
		}
		
		//load the previous question
		questionIndex--;
		
		$("#questionText").text(questions[questionIndex].text);
		
		$("#questionAnswers").find("label").each(function (i) {
			$(this).text(questions[questionIndex].answers[i]);
		});
		
		$(".questionNumber").text(questionIndex + 1);
		
		$("#questionAnswers").find("input").eq(answers[questionIndex]).attr("checked", "checked");
		
		//adjust the current subject if neccesary
		if (questions[questionIndex].subject != $("#quizSubjects").find(".currSubject").text()) {
			$("#quizSubjects").find(".currSubject").removeClass("currSubject");
			$("#quizSubjects").find(".subjectLabel").each( function() {
				if ($(this).text() == questions[questionIndex].subject) {
					$(this).addClass("currSubject");
				}
			});
		}
		
		//enable/disable the buttons
		$("#nextQuestionButton").removeClass("disabled");
		if (questionIndex == 0) {
			$("#prevQuestionButton").addClass("disabled");
		}
	});
	
	
	
	$("#questionAnswers").find("input").change( function () {
		$("#nextQuestionButton").removeClass("disabled");
	});

});

function startQuiz() {
	$("#questionText").text(questions[0].text);
	
	$("#questionAnswers").find("label").each(function (i) {
		$(this).text(questions[0].answers[i]);
	});
	
	//get the list of subjects for this quiz
	for (var i = 0; i < questions.length; i++) {
		if (i == 0 || questions[i - 1].subject != questions[i].subject) {
			$("#quizSubjects").append("<div class='subjectLabel'>" + questions[i].subject + "</div>");
		}
	}
	
	$("#quizSubjects").find(".subjectLabel").first().addClass("currSubject");
	
	$(".questionNumber").text("1");
	$(".questionTotal").text(questions.length);
	$(".progressPercent").text("0");
}

function finishQuiz() {
	//for testing
	alert( "Your answers:\n" + answers );
	
	//TODO: send the users answers for processing
}









