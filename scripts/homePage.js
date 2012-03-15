$(document).ready(function() { 
	
    //This function overrides the default form behavior so we can do validation
    $('#registerForm').submit(function() 
    {
        var passwordInput = $("#passwordInput").val()  
        var passwordConfirm = $("#pwConfirmInput").val();
        var email = $("#emailInput").val();
          
        //Passwords okay?      
        if(passwordInput != passwordConfirm)
        {
            //Show error
            $("#warningArea").show("fast");
            $("#warningArea").text("Passwords do not match");
        }
        else
        {
            //Hide error and perform normal form action
            $("#warningArea").hide("fast");            
               
            //Send our POST request
            $.post(
                "python/register.wsgi",
                $("#registerForm").serialize(),
                function(data)
                {
                	processRegisterRequest(data);
                }, "json");
        
        }
        
        return false;
    });
        
    //This function overrides the default form behavior so we can do validation
    $('#loginForm').submit(function() 
    {
        var email = $("#loginEmail").val()  
        var password = $("#loginPassword").val();
       
        //Send our POST request
        $.post(
            "python/login.wsgi",
            $("#loginForm").serialize(),
            function(data)
            {
				processLoginRequest(data);
            }, "json");

        return false;
    });
            
    //if mask is clicked
    $('#mask').click(function () {
        $(this).hide();
        $('.window').hide();
    });         
    
});

function processLoginRequest(data)
{
	if(data[0].status == 'Incorrect credentials')
	{
		alert("Wrong password!");	
	}
	else
	{
		window.location.replace("profile.html");
	}
}

function processRegisterRequest(data)
{
	if(data[0].status == 'User already exists')
	{
        $("#warningArea").show("fast");
        $("#warningArea").text("You already have an account! Please log in =)");		
	}
	else
	{           
		//Redirect
		window.location.replace("profile.html");
	}
}
