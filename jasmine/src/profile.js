	function processProfileInfo(data)
	{
		var user = data;
		//user full name
		$("#user_fullname").text(user[0]);
		$("#interests").text(user[0] + "'s Interests");
		
		//gender of user
		$("#gender").text("Gender: ");
		if (user[1]=='F')
			$("#gender").append("Female");
		else if (user[1]=='M') 
			$("#gender").append("Male");
		else if(user[1]=="Both")
			$("#gender").append("Both");
		
		//gender and age user is seeking for matches
		$("#seeking").text("Seeking: ");
		if (user[2]=='F')
			$("#seeking").append("Female");
		else if (user[2]=='M') 
			$("#seeking").append("Male");
		else if(user[2]=="Both")
			$("#seeking").append("Both");	
		$("#seeking").append(" (" + user[3] + "-" + user[4] +")");	
		
		//age of the user
		$("#age").text("Age: ");
		$("#age").append(user[5]);
		
		
		//relationship status of user
		$("#rstatus").text("Relationship Status: ");
		$("#rstatus").append(user[6]);
		
		//ethnicity of user
		$("#ethnicity").text("Ethnicity: ");
		$("#ethnicity").append(user[7]);
		
		//birth country of user
		$("#bCountry").text("Country of Birth: ");
		$("#bCountry").append(user[8]);
		
		//faculty of user
		$("#faculty").text("Faculty: ");
		$("#faculty").append(user[9]);
		
		//department of user
		$("#department").text("Department: ");
		$("#department").append(user[10]);
		
		
		//display the interests of the user, to keep it short only 6 interests to be displayed
		if(user.about_me!=null){
			var interests = (user[11]).split(",");
		}
		
		var i=0;
		$("li.interests_text").each(function(){
			if(interests.length>i){
				$(this).text(interests[i]);
				i++;	
			}
		});
			
						
	}