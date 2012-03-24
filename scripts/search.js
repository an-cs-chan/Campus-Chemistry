var userID = getCookie("userid");

$(document).ready(function() { 

	$("#accordion").accordion({
		collapsible: true,
		active: false,
		autoHeight: false
	});
	
	setPreferences();
	
	window.setTimeout(processSearch, 500);
	
	$("#advancedSearchHeader").on({
        click: function()
        {
			$("#searchSubject").toggle("slow");
        }		
	});
	
    $(".filterButton").on({
        click: function()
        {
            $(".filterButton").removeClass("selectedFilter");
            $(this).addClass("selectedFilter");
            
			processSearch();  	      
        }
    });
    
	$(".advancedComboBox").on({
        change: function()
        {   
		    $.post(
		        "python/search.wsgi",
				$("#basicForm").serialize(),
		        function(data)
		        {
		        	processBasicSearch(data);
		        }, "json");
		}
    });
    
    $(".filterSearch").on({
        change: function()
        {           
			processSearch();        
        }
    });
             
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
					var name = $( "#name" ).val()
					var message = $("#message").val()
							
					$.ajax({
						type: "POST",
						url: "python/send.wsgi",
						data: "name="+name+"&message="+message+"&userid="+userID,
					});							
							
					$( this ).dialog( "close" );	
					
					$("#alertArea").show("fast");
					$("#alertArea").text("Message sent to "+name+"!");
					
					//Remove the error in 3 seconds
					$("#alertArea").delay(2000).hide("slow");			
				}
			},
			Cancel: function() {
				$( this ).dialog( "close" );
			}
		}
	});
});

function processSearch()
{
	var selGender, selPref, selAgeMin, selAgeMax;
	
	selGender = $("#gender").val();
	selPref = $("#seeking").val();
	selAgeMin = $("#ageMin").val();
	selAgeMax = $("#ageMax").val();
	
	if(isNaN(selAgeMin) || isNaN(selAgeMax))
	{
		$("#warningArea").show("fast");
		$("#warningArea").text("Please enter valid ages.");
	}
	else if(selAgeMin < 18)
	{
		$("#warningArea").show("fast");
		$("#warningArea").text("Minimum age is 18.");
	}
	else if(selAgeMax > 99)
	{
		$("#warningArea").show("fast");
		$("#warningArea").text("Maximum age is 99.");
	}
	else if(selAgeMax < selAgeMin)
	{
		$("#warningArea").show("fast");
		$("#warningArea").text("Please enter a valid age range.");
	}
	else
	{
		$("#warningArea").hide("fast");
	
	    $.post(
	        "python/search.wsgi",
			$("#basicForm").serialize(),
	        function(data)
	        {
				processBasicSearch(data);              
	        }, "json");
	}
}

function processBasicSearch(data)
{	
	var html = "";
	
	//Check how many "displays" are currently selected and only show THAT many	
	var totRecords = 0;
	var displayType = "";
	
	//Pagination will be done by our nifty jPaginate :D
    $.each(data, function(index) 
    {      	
		var user = new UserInformation(data[index].name,data[index].department,data[index].type,data[index].about,data[index].picture,data[index].email);

    	displayType = $(".selectedFilter img").attr("id");
    	    	
        html += createUserBlock(user, index, displayType);
        
        totRecords++;
    });
    
    var showResults = 0;
    
	if(displayType == "smallDisplay")
    {
    	showResults = 9;
    }
    else
    {
    	showResults = 3;
    }
        
    if(totRecords > 0)
    {
    	$("#resultsArea").html(html);
    	    
	    $('#resultFooter').smartpaginator({
	        datacontainer: 'resultsArea',
	        dataelement:'div',
	    	totalrecords: totRecords,
	    	recordsperpage: showResults,
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
    
    //Set cookies to expire after session
    setCookie("minAge",$("#ageMin").val(),null);
	setCookie("maxAge",$("#ageMax").val(),null);
	setCookie("gender",$("#gender").val(),null);
	setCookie("pref",$("#seeking").val(),null);	
}

//This function will create those user profile squares we need for the search results area
function createUserBlock (user, id, displayType)
{
	if(user.About_Me != null && user.About_Me.length > 99)
	{
		var newString = user.About_Me.substring(0,99) + "...";
		user.About_Me = newString;
	}
		
	if(displayType == "smallDisplay")
	{
		var html = 
		"<div id='displayUser_" + id + "' class='displayUser' style='float:right'>" +
			"<img class='closeButton' src='images/close.png' onclick='removeSearchItem("+id+");' />" +
			"<a href='Profile.html?uid="+user.Email_ID+"'><img class='userPicture' src='"+user.Profile_Picture+"' /></a>" +
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
					"<img id='mailUser' onclick='openMailDialog(\""+user.Email_ID+"\");' src='images/envelope.png'>" +
				"</span>" +
				"<span class='userAction'>" +
					"<img id='likeUser' onclick='sendWink(\""+user.Email_ID+"\");' src='images/heart.png'>" +
				"</span>" +
			"</span>	" +
		"</div>";	
	}
	else
	{
		var html = 
		"<div id='displayUser_" + id + "' class='displayUser' style='width:96%;'>" +
			"<img class='closeButton' src='images/close.png' onclick='removeSearchItem("+id+");' />" +
			"<a href='Profile.html?uid="+user.Email_ID+"'><img class='userPicture' src='"+user.Profile_Picture+"' /></a>" +
			"<span class='userInfoPanel' style='float:left; margin:21px 10px 10px 0px;'>" +								
				"<span class='userInfoLabel'>" +
					"<span id='userNameText' class='userInfoText'>"+user.User_Name+"</span>" +
				"</span>" +
				"<br /> " +	
				"<span class='userInfoLabel'>" +
					"<span class='userInfoText'>"+user.Department+"</span>" +
				"</span>" +		
				"<br /> " +							
				"<span class='userInfoLabel'>" +
					"<span class='userInfoText'><b>About Me: </b></span>" +
				"</span>" +
				"</br>" +		
				"<span class='userInfoLabel'>" +
					"<span class='userInfoText'>"+user.About_Me+"</span>" +
				"</span>" +																
			"</span>	" +
		"</div>";
			
	}
		
	return html;	
}

function openMailDialog(name)
{
	$("#dialog-form" ).dialog( "open" );
	$("#name").val(name);
	$("#name").attr("readonly","true");
}

function sendWink(name)
{	
	$.ajax({
		type: "POST",
		url: "python/send.wsgi",
		data: "name="+name+"&message=You have received a wink!&userid="+userID,
	});	

	$("#alertArea").show("fast");
	$("#alertArea").text("Wink sent to "+name+"!");
	$("#alertArea").delay(3000).hide("slow");

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

function setPreferences()
{
	//Get search preferences from cookie
	var minAge = getCookie("minAge");
	var maxAge = getCookie("maxAge");
	var gender = getCookie("gender");
	var pref = getCookie("pref");

	//Create cookies + get data
	if(minAge == "" || maxAge == "" || gender == "" || pref == "")
	{
		if(userID != "" && userID != null)
		{
			$.post(
			    "python/getPreferences.wsgi",
				"userid="+userID,
			    function(data)
				{			    	
					if(data[0] == 'M')
					{
						pref = 'Men';
					}
					else if (data[0] == 'F')
					{
						pref = 'Women';
					}
					else
					{
						pref = 'Men/Women';
					}
					
					if(data[1] == 'M')
					{
						gender = 'Men';
					}
					else if (data[1] == 'F')
					{
						gender = 'Women';
					}
					else
					{
						gender = 'Men/Women';
					}					
					
					$("#gender").val(gender);
					$("#seeking").val(pref);
					$("#ageMin").val(data[2]+'');
					$("#ageMax").val(data[3]+'');
			    }, "json");	
		}	
	}
	else
	{
		//We are good!
		$("#gender").val(gender);
		$("#seeking").val(pref);
		$("#ageMin").val(minAge);
		$("#ageMax").val(maxAge);			
	}
}
//Javascript class for storing user information
function UserInformation(User_Name, Department, Body_type, About_Me, Profile_Picture, Email_ID)
{
	this.User_Name = User_Name;
	this.Department = Department;
	this.Body_type = Body_type;
	this.About_Me = About_Me; 
	this.Profile_Picture = Profile_Picture; 	
	this.Email_ID = Email_ID;
}
