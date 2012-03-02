$(document).ready(function() { 
	
    $(".filterButton").on({
        click: function()
        {
            $(".filterButton").removeClass("selectedFilter");
            $(this).addClass("selectedFilter");
            
			processSearch();  	      
        }
    });
    
    $(".filterSearch").on({
        change: function()
        {           
			processSearch();        
        }
    });
                 
    //This function overrides the default form behavior so we can do validation
    $('#logoutForm').submit(function()
    {           
        $.post(
            "python/logout.py",
            function(data)
            {
               //Redirect to home
                var url = "index.html";
                $(location).attr('href',url);
               
            }, "json");

        return false;
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
	    alert("Please enter valid ages");
	}
	else if(selAgeMin < 18)
	{
	    alert("Minimum age is 18");
	}
	else if(selAgeMax > 99)
	{
	    alert("Maximum age 99");
	}
	else if(selAgeMax < selAgeMin)
	{
	    alert("Please enter a valid age range");
	}
	else
	{
	    $.post(
	        "python/basicSearch.wsgi",
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
	var floatType = "";
	
	//Pagination will be done by our nifty jPaginate :D
	
    $.each(data, function(index) {
    	
    	if((index % 2) > 0)
    	{
    		floatType = "right";
    	}
    	else
    	{
    		floatType = "left";
    	}
    	
        html += createUserBlock(data[index][0],data[index][1],data[index][2], data[index][3], floatType, index);
        totRecords++;
    });
        
    if(totRecords > 0)
    {
    	$("#resultsArea").html(html);
    }
    else
    {
		 $("#resultFooter").html("");
		 $("#resultFooter").removeClass("pager red");
		 $("#resultsArea").html("<p>No Results To Display</p>");
    }
}

//This function will create those user profile squares we need for the search results area
function createUserBlock (name, age, department, userID, floatType, id)
{
	//TODO: Format different depending on which style is requested

	var html = 
		"<div id='displayUser_" + id + "' class='displayUser' style='float:"+floatType+"'>" +
			"<img class='closeButton' src='images/close.png' onclick='test("+id+");' />" +
			"<a href='Profile.html?uid="+userID+"'><img class='userPicture' src='images/test.png' /></a>" +
			"<span class='userInfoPanel'>" +								
				"<span id='userNameLabel' class='userInfoLabel'>" +
					"<span id='userNameText' class='userInfoText'>"+name+"</span>" +
				"</span>" +
				"</br>" +
				"<span id='userAgeLabel' class='userInfoLabel'>" +
					"<span id='userAgeText' class='userInfoText'>"+age+"</span>" +
				"</span>" +
				"</br>" +
				"<span id='userFacultyLabel' class='userInfoLabel'>" +
					"<span id='userFacultyText' class='userInfoText'>"+department+"</span>" +
				"</span>" +
				"</br>" +
				"<span class='userAction'>" +
					"<img id='mailUser' src='images/envelope.jpg'>" +
				"</span>" +
				"<span class='userAction'>" +
					"<img id='likeUser' src='images/heart.jpg'>" +
				"</span>" +
			"</span>	" +
		"</div>";	
    
		
	return html;	
}
