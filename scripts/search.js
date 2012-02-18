$(document).ready(function() { 

    $(".filterButton").on({
    
        click: function()
        {
            $(".filterButton").removeClass("selectedFilter");
            $(this).addClass("selectedFilter");
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
    
    //Basic search editing
    $("#editButton").on({
        
        click: function()
        {
            if($("#editButton").text() == "Edit")
            {
                var currGender, currPref, currAgeMin, currAgeMax;
                
                currGender = $("#searchGender").text();
                currPref = $("#searchPref").text();
                currAgeMin = $("#searchAgeMin").text();
                currAgeMax = $("#searchAgeMatch").text();

				//NOTE: Do not change this code right now, it will break the script. I'll fix this later
                $("#searchGender").html("<select name='gender' id='gender'><option name='M'>M</option><option name='F'>F</option></select>");           
                $("#searchPref").html("<select name='pref' id='seeking'><option name='M'>M</option><option name='F'>F</option></select>");
                $("#searchAgeMin").html("<input id='ageMin' name='minAge' value='"+currAgeMin+"' min='1' max='99' size='2' type='number' />");
                $("#searchAgeMatch").html("<input id='ageMax' name='maxAge' value='"+currAgeMax+"' min='1' max='99' size='2' type='number' />");
                
                selGender = $("#gender").val(currGender);
                selPref = $("#seeking").val(currPref);
                
                $("#editButton").text("Close");
            }
            else
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
                                    
                    $("#searchGender").html(selGender);
                    $("#searchPref").html(selPref);
                    $("#searchAgeMin").html(selAgeMin);
                    $("#searchAgeMatch").html(selAgeMax);
                    
                    $("#editButton").text("Edit");
                 }
            }
        }
    });  
});

function processBasicSearch(data)
{
	var html = "";
	
	//Check how many "displays" are currently selected and only show THAT many
	var limit = $(".selectedFilter").html();
	
    $.each(data, function(index) {
    	
    	if(index < limit)
    	{
        	html += createUserBlock(data[index][0],data[index][1],data[index][2]);
       	}
    });
    
    $("#resultsArea").html(html);
}

//This function will create those user profile squares we need for the search results area
function createUserBlock (name, age, department)
{
	//Jae: Here is the code thet creates those blocks, but it needs to be formated. Leave this for me for later.
	//Concentrate on making the filter stuff, I will deal with layout
	//For now, stick with paragraph tags for simplicity
	
	var html = name + " " + age + " " + department + "<br />";
	
	/*
	var html = 
		"<div id='displayUser'>" +
			"<img id='closeButton' src='images/close.png'>" +
			"<img id='userPicture' src='images/test.png'>" +
			"<div class='userInfoPanel'>" +								
				"<div id='userNameLabel' class='userInfoLabel'>" +
					"<span id='userNameText' class='userInfoText'>"+name+"</span>" +
				"</div>" +
				"</br>" +
				"<div id='userAgeLabel' class='userInfoLabel'>" +
					"<span id='userAgeText' class='userInfoText'>"+age+"</span>" +
				"</div>" +
				"</br>" +
				"<div id='userFacultyLabel' class='userInfoLabel'>" +
					"<span id='userFacultyText' class='userInfoText'>"+department+"</span>" +
				"</div>" +
				"</br>" +
				"<div class='userAction'>" +
					"<img id='mailUser' src='images/envelope.jpg'>" +
				"</div>" +
				"<div class='userAction'>" +
					"<img id='likeUser' src='images/heart.jpg'>" +
				"</div>" +
			"</div>	" +
		"</div>";	
    */
		
	return html;	
}
