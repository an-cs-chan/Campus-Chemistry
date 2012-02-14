$(document).ready(function() { 

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

                $("#searchGender").html("<select id='gender'><option name='Men'>Men</option><option name='Women'>Women</option><option name='Men or Women'>Men or Women</option></select>");           
                $("#searchPref").html("<select id='seeking'><option name='Men'>Men</option><option name='Women'>Women</option><option name='Men or Women'>Men or Women</option></select>");
                $("#searchAgeMin").html("<input id='ageMin' value='"+currAgeMin+"' min='1' max='99' size='2' type='number' />");
                $("#searchAgeMatch").html("<input id='ageMax' value='"+currAgeMax+"' min='1' max='99' size='2' type='number' />");
                
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