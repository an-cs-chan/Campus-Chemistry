	function processProfileInfo(data)
	{
		//user full name
		$("#user_fullname").text(data[0]);
		$("#interests").text(data[0] + "'s Interests");
		
		//gender of user
		$("#gender").text("Gender: ");
		if (data[1]=='F')
			$("#gender").append("Female");
		else if (data[1]=='M') 
			$("#gender").append("Male");
		else if(data[1]=="Both")
			$("#gender").append("Both");
		
		//gender and age user is seeking for matches
		$("#seeking").text("Seeking: ");
		if (data[2]=='F')
			$("#seeking").append("Female");
		else if (data[2]=='M') 
			$("#seeking").append("Male");
		else if(data[2]=="Both")
			$("#seeking").append("Both");	
		$("#seeking").append(" (" + data[10] + "-" + data[11] +")");	
		
		//age of the user
		$("#age").text("Age: ");
		$("#age").append(data[3]);
		
		
		//relationship status of user
		$("#rstatus").text("Relationship Status: ");
		$("#rstatus").append(data[4]);
		
		//ethnicity of user
		$("#ethnicity").text("Ethnicity: ");
		$("#ethnicity").append(data[5]);
		
		//birth country of user
		$("#bCountry").text("Country of Birth: ");
		$("#bCountry").append(data[6]);
		
		//faculty of user
		$("#faculty").text("Faculty: ");
		$("#faculty").append(data[7]);
		
		//department of user
		$("#department").text("Department: ");
		$("#department").append(data[8]);
		
		//document.getElementById("profilePicture").src = user.photo;
		
		//display the interests of the user, to keep it short only 6 interests to be displayed
		if(data[9]!=null){
			var interests = (data[9]).split(",");
		}
		
		var i=0;
		$("li.interests_text").each(function(){
			if(interests.length>i){
				$(this).text(interests[i]);
				i++;	
			}
		});
			
						
	}