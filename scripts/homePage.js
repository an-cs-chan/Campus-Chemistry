$(document).ready(function() { 

    //This function overrides the default form behavior so we can do validation
    $('#registerForm').submit(function() 
    {
        var passwordInput = $("#passwordInput").val()  
        var passwordConfim = $("#pwConfirmInput").val();
        var email = $("#emailInput").val();
          
        //Passwords okay?      
        if(passwordInput != passwordConfim)
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
                   //Bring up a modal dialog that says "Thanks!"
                   //Then, redirect
                    var url = "profile.html";
                    $(location).attr('href',url);
                   
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
                alert(data);
               
               //Redirect OR bring up a modal dialog saying "ERROR"
            }, "json");
            
        return false;
    });
        
    //select all the a tag with name equal to modal
    $('.modalDialog').click(function(e) {
        
        //Cancel the link behavior
        e.preventDefault();
        
        //Get the A tag
        var id = $(this).attr('href');
    
        //Get the screen height and width
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
    
        //Set heigth and width to mask to fill up the whole screen
        $('#mask').css({'width':maskWidth,'height':maskHeight});
        
        //tMake it fade-y 
        $('#mask').fadeIn(0);    
    
        //Get the window height and width
        var winH = $(window).height();
        var winW = $(window).width();
              
        //Center this bi-atch 
        $(id).css('top',  winH/2-$(id).height()/2);
        $(id).css('left', winW/2-$(id).width()/2);
    
        //transition effect
        $(id).fadeIn(0); 
    
    });
    
    //if close button is clicked, cancel out
    $('.window .close').click(function (e) {
        //Cancel the link behavior
        e.preventDefault();
        
        $('#mask').hide();
        $('.window').hide();
    });     
    
    //if mask is clicked, hide the window 
    $('#mask').click(function () {
        $(this).hide();
        $('.window').hide();
    });         
    
});