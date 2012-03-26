var userID = getCookie("userid");
var minAge;
var maxAge;
var gender;
var pref;
var toID;

$(document).ready(function() {
	
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
	
	$( "#date-Message-form" ).dialog({
		autoOpen: false,
		height: 350,
		width: 350,
		modal: true,
	});
});

function makeMatches()
{	
	$("#matches").html("");
	
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
    	    	    	    	
		var user = new UserInformation(data[index][0],data[index][1],data[index][2], data[index][3], data[index][4], data[index][5], data[index][6], data[index][7]);
    	    	
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
	
	var compat = "?";
	
	if(user.Compatibility != -1)
	{
		compat = user.Compatibility.toString();
	}
		
	var html = 
		"<div id='displayUser_" + id + "' class='displayUser' style='float:right'>" +
			"<img class='closeButton' src='images/close.png' onclick='removeSearchItem("+id+");' />" +
			"<a href='otherprofile.html?uid="+user.User_ID+"'><img class='userPicture' src='"+user.Profile_Picture+"' /></a>" +
			"<span class='matchInfoPanel'>" +								
				"<span class='matchInfoLabel'>" +
					"<span id='matchNameText' class='matchInfoText'>"+user.User_Name+"</span>" +
				"</span>" +
				"<br />" +
				"<span class='matchInfoLabel'>" +
					"<span class='matchInfoText'>"+user.Department+"</span>" +
				"</span>" +
				"<br />" +
				"<span class='matchAction'>" +
					"<img id='dateUser' onclick='openDateRequestDialog(\""+user.User_Name+"\",\""+user.User_ID+"\");' src='images/Martini_small.png'>" +
				"</span>" +
				"<span class='matchAction'>" +
					""+compat+"%" +
				"</span>" +
			"</span>	" +
		"</div>";
		
	return html;	
}

function getDates()
{
	$("#requestsArea").html("");
	$.ajax({
        type: "POST",
        url: "python/getDates.wsgi",
        data: {
            userID:userID
        },
        success: processDates
    });
}

function processDates(data)
{
	var html = "";
	
	//Check how many "displays" are currently selected and only show THAT many	
	var totRecords = 0;
	
	//Pagination will be done by our nifty jPaginate :D
    $.each(data, function(index) 
    {      	
		var date = new DateInformation(data[index][0], data[index][1], data[index][2], data[index][3], data[index][4], data[index][5], data[index][6], data[index][7], data[index][8], data[index][9], data[index][10]);
    	    	
        html += createDateBlock(date, index);
        
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

function createDateBlock (date, id)
{
	if(userID != date.From_ID)
	{
		if(date.State != "Declined")
		{
		var html = 
		"<div id='displayUser_" + id + "' class='displayMatch' style='float:right'>" +
			"<img class='closeButton' src='images/close.png' onclick='removeSearchItem("+id+");' />" +
			"<a href='otherprofile?uid="+date.From_ID+"'><img class='userPicture' src='"+date.From_Pic+"' /></a>" +
			"<span class='dateInfoPanel'>" +
				"<br />" +							
				"<span class='dateInfoLabel'>" +
					"<span id='dateNameText' class='matchInfoText'><b>From: </b>"+date.From_Name+"</span>" +
				"</span>" +
				"<br />" +
				"<span class='dateInfoLabel'>" +
					"<span class='dateInfoText'>"+date.State+"</span>" +
				"</span>" +
				"<br />" +
				"<span class='dateInfoLabel'>" +
					"<span class='dateInfoText'>"+date.dDate+"</span>" +
				"</span>" +
				"<br />" +
				"<span class='dateInfoLabel'>" +
					"<span class='dateInfoText'>Time: "+date.dTime+"</span>" +
				"</span>" +
				"<br />" +
				"<span class='matchAction'>" +
					"<img id='dateUser' onclick='openDateMessageDialog(\""+date.dMess+"\");' src='images/QuestionMarkSmall.png'>" +
				"</span>" +
				"<span class='matchAction'>" +
					"<img id='dateUser' onclick='modDate(\""+date.date_ID+"\",\"Agreed!\");' src='images/thumbup_small.png'>" +
				"</span>" +
				"<span class='matchAction'>" +
					"<img id='dateUser' onclick='modDate(\""+date.date_ID+"\",\"Declined\");' src='images/thumbdown_small.png'>" +
				"</span>" +
			"</span>	" +
		"</div>";
		}
		else
		{
			var html = '';
		}
	}
	else
		var html = 
		"<div id='displayUser_" + id + "' class='displayMatch' style='float:right'>" +
			"<img class='closeButton' src='images/close.png' onclick='removeSearchItem("+id+");' />" +
			"<a href='otherprofile?uid="+date.To_ID+"'><img class='userPicture' src='"+date.To_Pic+"' /></a>" +
			"<span class='dateInfoPanel'>" +	
				"<br />" +							
				"<span class='dateInfoLabel'>" +
					"<span id='dateNameText' class='matchInfoText'><b>To: </b>"+date.To_Name+"</span>" +
				"</span>" +
				"<br />" +
				"<span class='dateInfoLabel'>" +
					"<span class='dateInfoText'>"+date.State+"</span>" +
				"</span>" +
				"<br />" +
				"<span class='dateInfoLabel'>" +
					"<span class='dateInfoText'>"+date.dDate+"</span>" +
				"</span>" +
				"<br />" +
				"<span class='dateInfoLabel'>" +
					"<span class='dateInfoText'>Time: "+date.dTime+"</span>" +
				"</span>" +
				"<br />" +
				"<span class='matchAction'>" +
					"<img id='dateUser' onclick='openDateMessageDialog(\""+date.dMess+"\");' src='images/QuestionMarkSmall.png'>" +
				"</span>" +
				"<span class='matchAction'>" +
					"<img id='dateUser' onclick='modDate(\""+date.date_ID+"\",\"Closed\");' src='images/cancel-button.jpg'>" +
				"</span>" +
			"</span>	" +
		"</div>";
		
	return html;	
}

function openDateRequestDialog(name, uID)
{
	$("#dialog-form" ).dialog( "open" );
	$("#name").val(name);
	$("#name").attr("readonly","true");
	$("#date").attr("readonly","true");
	toID = uID;
}

function openDateMessageDialog(dMess)
{
	$("#date-Message-form" ).dialog( "open" );
	$("#date-message").val(dMess);
	$("#date-message").attr("readonly","true");
}

function modDate(dID, State)
{
	$.ajax({
        type: "POST",
        url: "python/modDate.wsgi",
        data: {
            dateID:dID,
            State:State
        },
        success: getDates
    });
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
function UserInformation(User_Name, Department, User_ID, Body_type, About_Me, Profile_Picture, Email_ID, Compatibility)
{ 
	this.User_Name = User_Name;
	this.Department = Department;
	this.User_ID = User_ID;
	this.Body_type = Body_type;
	this.About_Me = About_Me; 
	this.Profile_Picture = Profile_Picture;
	this.Email_ID = Email_ID;
	this.Compatibility = Compatibility;
}

function DateInformation(To_Name, To_Pic, From_Name, From_Pic, date_ID, To_ID, From_ID, State, dDate, dTime, dMess)
{
	this.To_Name = To_Name;
	this.To_Pic = To_Pic;
	this.From_Name = From_Name;
	this.From_Pic = From_Pic;
	this.date_ID = date_ID
	this.To_ID = To_ID;
	this.From_ID = From_ID;
	this.State = State;
	this.dDate = dDate;
	this.dTime = dTime;
	this.dMess = dMess;
}
