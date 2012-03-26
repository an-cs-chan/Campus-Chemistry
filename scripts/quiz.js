var sessionID = getCookie("sessionid");
var userID = getCookie("userid");

var questions;
var answers;
var questionIndex;

$(document).ready(function () {

    loadQuiz();
    
	
    
    $("body").keydown(function(e) {
        if(e.keyCode == 37) {
            $("#prevQuestionButton").trigger("click");
        }
        else if(e.keyCode == 39) {
            $("#nextQuestionButton").trigger("click");
        }
    });
            
    
	
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

function loadQuiz() {
    $("#quizPanelOverlay").find(".loader").css("display", "");
    
    $.ajax({
        type: "POST",
        url: "python/getQuiz.wsgi",
        success: onLoadQuizComplete
    });
}

function onLoadQuizComplete(data) {
    questions = data;
    
    $.ajax({
        type: "POST",
        url: "python/getAnswers.wsgi",
        data: { userID:userID },
        success: onLoadAnswersComplete
    });
}

function onLoadAnswersComplete(data) {
    if (data != null) {
        $("#quizAboutText").html("You've already completed the compatability test.<br/>You can re-take the test, but you're previous answers will be overwritten.");
    }
    $("#quizAboutText").css("display", "");
    
    $("#quizPanelOverlay").find(".loader").css("display", "none");
    $("#quizPanelOverlay").find(".overlayContent").css("display", "");
    
    $("#quizPanelOverlay").bind("click", function() {
        startQuiz();
    });
}

function startQuiz() {
	answers = [];
	questionIndex = 0;

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
    
    $("#quizPanelOverlay").find(".overlayContent").css("display", "none");
    $("#quizPanelOverlay").css("display", "none");
    $("#quizAboutText").css("display", "none");
    $("#quizPanelLeft").css("display", "");
    $("#quizPanelRight").css("display", "");
}

function finishQuiz() {
    $("#quizPanelLeft").css("display", "none");
    $("#quizPanelRight").css("display", "none");
    $("#quizPanelOverlay").css("display", "");
    $("#quizPanelOverlay").find(".loader").css("display", "");
    $("#quizPanelOverlay").find(".loader").find("p").text("Saving answers...");
    
	$.ajax({
        type: "POST",
        url: "python/saveAnswers.wsgi",
        data: {
            userID:userID, 
            userAnswers:answers.join("")
        },
        success: onFinishQuizComplete
    });
}

function onFinishQuizComplete(data) {
    $("#quizPanelOverlay").find(".loader").css("display", "none");
    $("#quizPanelOverlay").find(".overlayContent").css("display", "");
    $("#quizPanelOverlay").find(".overlayContent").find("p").text("Compatability test complete!");
    
    setTimeout("location.href='profile.html'", 3000);
}

function generateTestAnswers() {
    answers = [];
    for(var i=0; i<50; i++){
        answers.push(Math.floor(Math.random()*4));
    }
    return answers;
}









