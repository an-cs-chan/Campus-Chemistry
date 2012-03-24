//Get user ID
	var userID = getCookie("userid");


	$(document).ready(function () {
		Page_Load();
	});

	function Page_Load(){
		
		//get data about user profile
		$.post(
				"python/profile.wsgi",
				"userid="+userID,
				function(data)
				{
					processProfileInfo(data);              
				}, "json");
			//show button	
			$("#profilePicture").mouseover(function(){
			$("#uploadPic").css('visibility','visible');
			$("#uploadPic").attr('disabled','false');
		});
		
			//hide button
			$("#profilePicture").mouseout(function(){
			$("#uploadPic").css('visibility','hidden');
			$("#uploadPic").attr('disabled','true');
		});
		
		$("#saveProfile").click(function(){
			saveProfileInfo()
		});
					
	}
	
	function processProfileInfo(data){
		var user = data[0];
		var option;
		
		//user full name
		$("#user_fullname").val(user.name);
		$("#interests").text(user.name + "'s Interests");
		
		//gender of user
		$("#selectgender option[selected]").removeAttr("selected");
		option = "#selectgender option[value='" + user.gender + "']";
		$(option).attr("selected", "selected");
		
		//gender and age user is seeking for matches
		$("#selectseekgender option[selected]").removeAttr("selected");
		option = "#selectseekgender option[value='" + user.seeking + "']";
		$(option).attr("selected", "selected");
		
		$("#selectseekstart option[selected]").removeAttr("selected");
		option = "#selectseekstart option[value='" + user.minagepref + "']";
		$(option).attr("selected", "selected");
		
		$("#selectseekend option[selected]").removeAttr("selected");
		option = "#selectseekend option[value='" + user.maxagepref + "']";
		$(option).attr("selected", "selected");
		
		//age of the user
		$("#age").text("Age: ");
		$("#age").append(user.age);
		
		//relationship status of user
		$("#selectstatus option[selected]").removeAttr("selected");
		option = "#selectstatus option[value='" + user.rtype + "']";
		$(option).attr("selected", "selected");
		
		//ethnicity of user
		$("#ethnicity").val(user.ethnicity);
		
		//birth country of user
		$("#bCountry").val(user.bCountry);
		
		//faculty of user
		$("#faculty").val(user.faculty);
		
		//department of user
		$("#department").val(user.department);		
		
		//display the interests of the user, to keep it short only 6 interests to be displayed
		if(user.about_me!=null){
			var interests = (user.about_me).split(",");
		}
	}


	function saveProfileInfo(){
		var name = $("#user_fullname").val();
		var gender = $("#selectgender").val();
		var seekingGender = $("#selectseekgender").val();
		var seekingStart = parseInt($("#selectseekstart").val());
		var seekingEnd = parseInt($("#selectseekend").val());
		var month;
		var day;
		var year;
		var rStatus = $("#selectstatus").val();
		var ethnicity = $("#ethnicity").val();
		var bCountry = $("#bCountry").val();
		var faculty = $("#faculty").val();
		var deptmt = $("#department").val();
		
		$.ajax({
				type: "POST",
				url: "python/editprofile.wsgi",
				data: "userid="+userID+"&name="+name+"&gender="+gender+"&seekGender="+seekingGender+"&seekStart="+seekingStart+"&seekEnd="+seekingEnd+"&rStatus="+rStatus+"&ethnicity="+ethnicity+"&bCountry="+bCountry+"&faculty="+faculty+"&deptmt="+deptmt,
				success: function(msg){
        		}
		});
		
	}
