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
	}
	
	function processProfileInfo(data)
	{
		var user = data[0];
		//user full name
		$("#user_fullname").text(user.name);
		$("#interests").text(user.name + "'s Interests");
		
		//gender of user
		$("#gender").text("Gender: ");
		if (user.gender=='F')
			$("#gender").append("Female");
		else if (user.gender=='M') 
			$("#gender").append("Male");
		else if(user.gender=="Both")
			$("#gender").append("Both");
		
		//gender and age user is seeking for matches
		$("#seeking").text("Seeking: ");
		if (user.seeking=='F')
			$("#seeking").append("Female");
		else if (user.seeking=='M') 
			$("#seeking").append("Male");
		else if(user.seeking=="Both")
			$("#seeking").append("Both");	
		$("#seeking").append(" (" + user.minagepref + "-" + user.maxagepref +")");	
		
		//age of the user
		$("#age").text("Age: ");
		$("#age").append(user.age);
		
		
		//relationship status of user
		$("#rstatus").text("Relationship Status: ");
		$("#rstatus").append(user.rtype);
		
		//ethnicity of user
		$("#ethnicity").text("Ethnicity: ");
		$("#ethnicity").append(user.ethnicity);
		
		//birth country of user
		$("#bCountry").text("Country of Birth: ");
		$("#bCountry").append(user.bCountry);
		
		//faculty of user
		$("#faculty").text("Faculty: ");
		$("#faculty").append(user.faculty);
		
		//department of user
		$("#department").text("Department: ");
		$("#department").append(user.department);
		
		//display the interests of the user, to keep it short only 6 interests to be displayed
		if(user.about_me!=null){
			var interests = (user.about_me).split(",");
		}
		
		var i=0;
		$("li.interests_text").each(function(){
			if(interests.length>i){
				$(this).text(interests[i]);
				i++;	
			}
		});
			
						
	}