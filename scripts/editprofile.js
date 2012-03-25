//Get user ID
	var userID = getCookie("userid");
	var ageArray = new Array();

	$(document).ready(function () {
		Page_Load();
	});
	
	
	function Page_Load(){
		
		generateAgeArray();
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
			
		$("#saveProfile").click(function(){
			saveProfileInfo()
		});
		
		$("#month").change(function(){
			updateDays();
		});
		
		$("#year").change(function(){
			updateDays();
		});
		
		$("#selectseekstart").change(function(){
			updateSeekEnd();
		});
					
	}
	
	function generateAgeArray(){
			ageArray[0]=18;
			ageArray[1]=20;
			ageYoung=25;
			ageOld=60;
			
			for (var age=ageYoung; age<=ageOld; age+=5){
				ageArray.push(age);
			}
			
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
		
		var selectedDay = $("#day").val();
		 
		$("#day").children().remove()
		var maxDays=31;
		var month = parseInt($("#month").val());
		var year = parseInt($("#year").val()); 
		
		switch (month) {
            case 1: case 3: case 5:
            case 7: case 8: case 10:
            case 12:
                maxDays = 31;
                break;
            case 4: case 6:
            case 9: case 11:
                maxDays = 30;
                break;
            case 2:
                if (((year % 4 == 0) && 
                     !(year % 100 == 0))
                     || (year % 400 == 0))
                    maxDays = 29;
                else
                    maxDays = 28;
                break;
            default:
                maxDays=31;	
                break;
        }
		
		
		var objSelect = document.getElementById("day");
		
		for(var dayOption=1;dayOption<=maxDays; dayOption++){
			var objOption = document.createElement("option");
			objOption.text = dayOption;
			objOption.value = dayOption;
			
			objSelect.add(objOption);
		
		}
		
		$("#day option[selected]").removeAttr("selected");
		option = "#day option[value='" + selectedDay + "']";
		$(option).attr("selected", "selected");	
	}
	
	function updateSeekEnd(){
		
		var minAge=$("#selectseekstart").val();
		$("#selectseekend").children().remove();
		
		var objSelect = document.getElementById("selectseekend");
		
		for(var ageCounter=0;ageCounter<ageArray.length; ageCounter++){
			if(ageArray[ageCounter]>minAge){
				var objOption = document.createElement("option");
				objOption.text = ageArray[ageCounter];
				objOption.value = ageArray[ageCounter];
			
				objSelect.add(objOption);
			}
		}
		
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
		//month
		$("#month option[selected]").removeAttr("selected");
		option = "#month option[value='" + user.bMonth + "']";
		$(option).attr("selected", "selected");
		//day
		$("#day option[selected]").removeAttr("selected");
		option = "#day option[value='" + user.bDay + "']";
		$(option).attr("selected", "selected");
		//year
		$("#year option[selected]").removeAttr("selected");
		option = "#year option[value='" + user.bYear + "']";
		$(option).attr("selected", "selected");
		
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
		
		//profile picture URL
		document.getElementById("profilePicture").src = user.photo;
		$("#photo").val(user.photo);
		
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
		
		var month=$("#month").val();
		var day=$("#day").val();
		var year=$("#year").val();
		
		var rStatus = $("#selectstatus").val();
		var ethnicity = $("#ethnicity").val();
		var bCountry = $("#bCountry").val();
		var faculty = $("#faculty").val();
		var deptmt = $("#department").val();
		var photo = $("#photo").val();
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
				data: "userid="+userID+"&name="+name+"&gender="+gender+"&seekGender="+seekingGender+"&seekStart="+seekingStart+"&seekEnd="+seekingEnd+"&year="+year+"&month="+month+"&day="+day+"&rStatus="+rStatus+"&ethnicity="+ethnicity+"&bCountry="+bCountry+"&faculty="+faculty+"&deptmt="+deptmt+"&photo="+photo+"&interests="+interests,
				success: function(msg){
					parent.location='profile.html';
        		}
		});
		
	}
