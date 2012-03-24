//Get user ID
	var userID = getCookie("userid");


	$(document).ready(function () {
		Page_Load();
	});

	function Page_Load(){
		
		loadDays();
		loadYears();
		
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
		
		$("#day").change(function(){
			updateDays();
		});
					
	}
	
	function loadDays(){
		//initial selected value for month is January, so 31 days need to be generated
		var maxDays=31;
		
		var objSelect = document.getElementById("day");
		
		for(var dayOption=1;dayOption<=maxDays; dayOption++){
			var objOption = document.createElement("option");
			objOption.text = dayOption;
			objOption.value = dayOption;
			
			objSelect.add(objOption);
		}
		
	}
	function loadYears(){
		var yearToday = new Date();
		var tooOld = 60;
		var justOldEnough = 18;
		
		var yearStart = yearToday.getFullYear() - tooOld;
		var yearEnd =  yearToday.getFullYear() - justOldEnough;
		
		var objSelect = document.getElementById("year");
		
		for (var yearOption=yearEnd; yearOption>=yearStart; yearOption--){
			var objOption = document.createElement("option");
			objOption.text = yearOption;
			objOption.value = yearOption;
			
			objSelect.add(objOption);
		}
		
	}
	
	function updateDays(){
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
		
		var i=0;
		$(".interestTextEntry").each(function(){
			if(interests.length>i){
				$(this).val(interests[i]);
				i++;	
			}
		});
		
	}


	function saveProfileInfo(){
		var name = $("#user_fullname").val();
		var gender = $("#selectgender").val();
		var seekingGender = $("#selectseekgender").val();
		var seekingStart = $("#selectseekstart").val();
		var seekingEnd = $("#selectseekend").val();
		var month;
		var day;
		var year;
		var rStatus = $("#selectstatus").val();
		var ethnicity = $("#ethnicity").val();
		var bCountry = $("#bCountry").val();
		var faculty = $("#faculty").val();
		var deptmt = $("#department").val();
		var interests="";
		
		//concatenating each interest
		$(".interestTextEntry").each(function(){
			interests += $(this).val() +",";
		});
		
		if(interests.length>0)
			interests = interests.substring(0,interests.length-1);
		
		$.ajax({
				type: "POST",
				url: "python/editprofile.wsgi",
				data: "userid="+userID+"&name="+name+"&gender="+gender+"&seekGender="+seekingGender+"&seekStart="+seekingStart+"&seekEnd="+seekingEnd+"&rStatus="+rStatus+"&ethnicity="+ethnicity+"&bCountry="+bCountry+"&faculty="+faculty+"&deptmt="+deptmt+"&interests="+interests,
				success: function(msg){
        		}
		});
		
	}
