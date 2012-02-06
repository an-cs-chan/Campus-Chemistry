$(document).ready(function() {  

    $("#signUpButton").click(function() {
        //Gather the information from E-Mail and Password and Confirm
        
        var passwordInput = $("#passwordInput").val()  
        var passwordConfim = $("#pwConfirmInput").val();
        var email = $("#emailInput").val();
               
        //if(passwordInput != passwordConfim)
        //{
        //    alert("Passwords do not match");
        //}
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
        
        //transition effect     
        $('#mask').fadeIn(0);    
    
        //Get the window height and width
        var winH = $(window).height();
        var winW = $(window).width();
              
        //Set the popup window to center
        $(id).css('top',  winH/2-$(id).height()/2);
        $(id).css('left', winW/2-$(id).width()/2);
    
        //transition effect
        $(id).fadeIn(0); 
    
    });
    
    //if close button is clicked
    $('.window .close').click(function (e) {
        //Cancel the link behavior
        e.preventDefault();
        
        $('#mask').hide();
        $('.window').hide();
    });     
    
    //if mask is clicked
    $('#mask').click(function () {
        $(this).hide();
        $('.window').hide();
    });         
    
});