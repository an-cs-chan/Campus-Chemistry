var userID = getCookie("userid");
var minAge;
var maxAge;
var gender;
var pref;
var toID;

$(document).ready(function() { 
	
	window.setTimeout(makeMatches, 500);
	
    makeMatches();
    getDates();
             
	$( "#dialog-form" ).dialog({
		autoOpen: false,
		height: 350,
		width: 350,
		modal: true,
		buttons: {
			"Send": function() {
				var bValid = true;

				if ( bValid ) {									
				// we want to store the values from the form input box, then send via ajax below
					var date = $( "#date" ).val()
					var time = $( "#time" ).val()
					var message = $("#message").val()
						$.ajax({
							type: "POST",
							url: "python/makeDate.wsgi",
							data: "userID="+userID+"&toID="+toID+"&dateTime="+time+"&dateDate="+date+"&dateMessage="+message,
							});
					$( this ).dialog( "close" );
					$( "#date" ).val("");
					$( "#time" ).val("");
					$( "#message" ).val("");
					makeMatches();
					getDates();		
				}
			},
			Cancel: function() {
				$( this ).dialog( "close" );
			}
		}
	});
});

function makeMatches()
{	
	$("#matches").html("");
	$("#warningArea").hide("fast");
	
	$.ajax({
        type: "POST",
        url: "python/getMatches.wsgi",
        data: {
            userID:userID
        },
        success: processMatches
    });
}

function processMatches(data)
{
	var html = "";
	
	//Check how many "displays" are currently selected and only show THAT many	
	var totRecords = 0;
	var displayType = "";
	
	//Pagination will be done by our nifty jPaginate :D
    $.each(data, function(index) 
    {
    	    	    	    	
		var user = new UserInformation(data[index][0],data[index][1],data[index][2], data[index][3], data[index][4], data[index][5], data[index][6]);
    	    	
        html += createUserBlock(user, index, displayType);
    });
    
   	$("#matches").html(html);
}

//This function will create those user profile squares we need for the search results area
function createUserBlock (user, id, displayType)
{
	if(user.About_Me != null && user.About_Me.length > 99)
	{
		var newString = user.About_Me.substring(0,99) + "...";
		user.About_Me = newString;
	}
		
	var html = 
		"<div id='displayUser_" + id + "' class='displayUser' style='float:right'>" +
			"<img class='closeButton' src='images/close.png' onclick='removeSearchItem("+id+");' />" +
			"<a href='Profile.html?uid="+user.User_ID+"'><img class='userPicture' src='"+user.Profile_Picture+"' /></a>" +
			"<span class='userInfoPanel'>" +								
				"<span class='userInfoLabel'>" +
					"<span id='userNameText' class='userInfoText'>"+user.User_Name+"</span>" +
				"</span>" +
				"<br />" +
				"<span class='userInfoLabel'>" +
					"<span class='userInfoText'>"+user.Body_type+"</span>" +
				"</span>" +
				"<br />" +
				"<span class='userInfoLabel'>" +
					"<span class='userInfoText'>"+user.Department+"</span>" +
				"</span>" +
				"<br />" +
				"<span class='userAction'>" +
					"<img id='dateUser' onclick='openDateRequestDialog(\""+user.User_Name+"\","+user.User_ID+");' src='images/Martini_small.png'>" +
				"</span>" +
			"</span>	" +
		"</div>";
		
	return html;	
}

function getDates()
{
}

function processDates(data)
{
	var html = "";
	
	//Check how many "displays" are currently selected and only show THAT many	
	var totRecords = 0;
	
	//Pagination will be done by our nifty jPaginate :D
    $.each(data, function(index) 
    {      	
		var date = new DateInformation(data[index].name,data[index].department,data[index].id,data[index].type,data[index].about,data[index].picture,data[index].email);

    	displayType = $(".selectedFilter img").attr("id");
    	    	
        html += createUserBlock(user, index, displayType);
        
        totRecords++;
    });

	if(totRecords > 0)
    {
    	$("#requestsArea").html(html);
    	    
	    $('#requestsFooter').smartpaginator({
	        datacontainer: 'requestsArea',
	        dataelement:'div',
	    	totalrecords: totRecords,
	    	recordsperpage: 3,
	    	theme: 'teal',
		 	length: 10
	    });
    }
    else
    {
		 $("#resultFooter").html("");
		 $("#resultFooter").removeClass("pager red");
		 $("#resultsArea").html("<p>No Results To Display</p>");
    }
}

function openDateRequestDialog(name, uID)
{
	$("#dialog-form" ).dialog( "open" );
	$("#name").val(name);
	$("#name").attr("readonly","true");
	$("#date").attr("readonly","true");
	toID = uID;
}

//This function removes a user block from the page
function removeSearchItem(id)
{
	$("img.closeButton").click(function(){
    	jQuery(this).parent().remove();
    });
        	
	$("#displayUser_"+id).css("display","none");

	/*Bug: Refresh paginator*/
}

//Javascript class for storing user information
function UserInformation(User_Name, Department, User_ID, Body_type, About_Me, Profile_Picture, Compatibility)
{
	this.User_Name = User_Name;
	this.Department = Department;
	this.User_ID = User_ID;
	this.Body_type = Body_type;
	this.About_Me = About_Me; 
	this.Profile_Picture = Profile_Picture;
	this.Compatibility = Compatibility;
}

function DateInformation(To_Name, From_Name, To_ID, From_ID, State, dDate, dTime, dMess)
{
	this.To_Name = To_Name;
	this.From_Name = From_Name;
	this.To_ID = To_ID;
	this.From_ID = From_ID;
	this.State = State;
	this.dDate = dDate;
	this.dTime = dTime;
	this.dMess = dMess;
}
