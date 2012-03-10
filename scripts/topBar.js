//Get our session and user IDs
var sessionID = getCookie("sessionid");
var userID = getCookie("userid");

//Check security
checkSessionExpired(sessionID);

$(document).ready(function() 
{ 	
	//Set greeting message
	$("#useridGreeting").html(userID);
	
    $("#logoutButton").on({
        click: function()
        {
        	window.location.replace("index.html");
			
			document.cookie = 'sessionid='+sessionID+'; expires=Thu, 2 Aug 2001 20:00:00 UTC; path=/ ';
			
			//Allows us to do what we want, overrides default
			return false;
        }
    });    
	
});

function getCookie(value)
{
	var i,x,y,ARRcookies = document.cookie.split(";");
	
	for (i = 0; i < ARRcookies.length;i ++)
	{
		x = ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
		y = ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
		x = x.replace(/^\s+|\s+$/g,"");
		y = y.replace(/\"/g,"");
		
		if (x == value)
		{
			return unescape(y);
		}
	}
	
	return "";
}

function setCookie(c_name, value, exdays)
{
	var exdate=new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
	document.cookie=c_name + "=" + c_value;
}

function checkSessionExpired(session)
{	
	$.post(
	    "python/checkSession.wsgi",
		"session="+session,
	    function(data)
	    {
			if(data[0].status == 'Invalid SessionID')
			{
				alert("Cookie expired! Please log in again =)");
				window.location.replace("index.html");
			}
	    }, "json");	
}