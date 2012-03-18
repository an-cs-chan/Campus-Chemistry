	//Get our session and user IDs
	var sessionID = getCookie("sessionid");
	var userID = getCookie("userid");


	$(document).ready(function () {
		Page_Load();
	});


	function Page_Load(){
		alert("bye");
		$.post(
				"python/profile.wsgi",
				"userid="+userID,
				function(data)
				{
					processProfileInfo(data);              
				}, "json");
			
		$("#profilePicture").mouseover(function(){
			$("#uploadPic").css('visibility','visible');
			$("#uploadPic").attr('disabled','false');
		});
		
		$("#profilePicture").mouseout(function(){
			$("#uploadPic").css('visibility','hidden');
			$("#uploadPic").attr('disabled','true');
		});
					
	}
	
	function processProfileInfo(data)
	{
		alert("hello");
		alert(data);
	}

	function getCookie(value)
	{
		var i,x,y,ARRcookies = document.cookie.split(";");
		var userID, sessionid;
		
		for (i = 0; i < ARRcookies.length;i ++)
		{
			x = ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
			y = ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
			x = x.replace(/^\s+|\s+$/g,"");
			
			if (x == value)
			{
				return unescape(y);
			}
		}
		
		return "";
	}