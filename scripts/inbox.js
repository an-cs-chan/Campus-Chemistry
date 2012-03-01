$(document).ready(function() {


	processMessage();
    //var htmlStr = $('a#opener').live(html());
	//alert("htmlStr");
	
/*(function($) {
	$.fn.ellipsis = function(enableUpdating){
		var s = document.documentElement.style;
		if (!('textOverflow' in s || 'OTextOverflow' in s)) {
			return this.each(function(){
				var el = $(this);
				if(el.css("overflow") == "hidden"){
					var originalText = el.html();
					var w = el.width();
					
					var t = $(this.cloneNode(true)).hide().css({
                        'position': 'absolute',
                        'width': 'auto',
                        'overflow': 'visible',
                        'max-width': 'inherit'
                    });
					el.after(t);
					
					var text = originalText;
					while(text.length > 0 && t.width() > el.width()){
						text = text.substr(0, text.length - 1);
						t.html(text + "...");
					}
					el.html(t.html());
					
					t.remove();
					
					if(enableUpdating == true){
						var oldW = el.width();
						setInterval(function(){
							if(el.width() != oldW){
								oldW = el.width();
								el.html(originalText);
								el.ellipsis();
							}
						}, 200);
					}
				}
			});
		} else return this;
	};
})(jQuery);
			*/
			
	//This function overrides the default form behavior so we can do validation
    $('#logoutForm').submit(function()
    {           
        $.post( "python/logout.py",function(data)
            {
               //Redirect to home
                var url = "index.html";
                $(location).attr('href',url);
               
            }, "json");

        return false;
    });
});

function processMessage()
{
	$.post( "python/inbox.wsgi", 
	function(data) 
	{
		showMessage(data);
	},"json");
}

function showMessage(data)
{
	var htmla = "";	
	var totRecords = 0;
	var floatType = "";
	htmla = "<table class='sample'> " +
				"<thead><tr> "+
						"<th width=5%>Select</th>" + 
						"<th width=50%>Message</th>" +
						"<th width=15%>From</th>" + 
						"<th width=20%>Time</th>" + 
						"<th width=10%>Delete</th>" + 
						"</tr>" +
					"</thead>" +	
 				"<tbody>"; 
	//Pagination will be done by our nifty jPaginate :D
	
	$.each(data, function(index) {
	//Todo:
	//if (len(data[index][2])>50)
	 // clip clip Add ...
	//$("#opener").ellipsis()
      htmla += "<tr id='displayMessage_" + data[index][0] + "' class='even' data-href=''>" + 
				"<td><input type='checkbox' name='message_id' value=" + data[index][0] + " /></td>" +
				"<td><a class='opener' id='"+index+"' href='#'>" + data[index][2] + "</a></td>" + 
				"<td>" + data[index][1] + "</td>" + 
				"<td>" + data[index][3] + "</td>" + 
				"<td><img class='closeButton' style='left: 18px; top: 0px' src='images/cancel.png' onclick='test("+data[index][0]+");' /></td>" + 
			"</tr>";
			totRecords++;
    });
	
	var $dialog=new Array();
	$.each(data, function(index){
	$dialog[index] = $('<div style="background-color:#D6EEF7"></div>').html(data[index][2])
			.dialog({
				autoOpen: false,
				height: 300,
				width: 350,
				title: 'Message',
				/*modal: true,
				buttons: {
				"Reply": function() {
					var bValid = true;
					allFields.removeClass( "ui-state-error" );

					//bValid = bValid && checkLength( name, "username", 3, 16 );
					//bValid = bValid && checkLength( subject, "subject", 6, 80 );
					//bValid = bValid && checkLength( message, "message", 5, 16 );

					//bValid = bValid && checkRegexp( name, /^[a-z]([0-9a-z_])+$/i, "Username may consist of a-z, 0-9, underscores, begin with a letter." );
					//bValid = bValid && checkRegexp( subject, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com" );
					//bValid = bValid && checkRegexp( message, /^([0-9a-zA-Z])+$/, "message field only allow : a-z 0-9" );

					if ( bValid ) {
										
					// we want to store the values from the form input box, then send via ajax below
						var name = $( "#name" ).val()
						//alert(name);
						//var subject = subject.val()
						var message = $("#message").val()
							$.ajax({
								type: "POST",
								url: "python/send.wsgi",
								data: "name="+name+"&message="+message,
								});
						$( this ).dialog( "close" );					
					}
				},
			},*/
			
		});			
		});
		
	//$.each(data, function(index){	
	$('.opener').live("click", function(event) {
			var match_id = $(this).attr("id");
			$dialog[match_id].dialog('open');
			//alert(event.target.id);
			//$(this).append("Clicked");
			//$dialog[document.getElementById("opener")].dialog('open');
			// prevent the default action, e.g., following a link
			return false;
			});
    //});

	htmla += "</tbody>" +
	        "</table>";
        
    if(totRecords > 0)
    {
    	$("#questionAnswers").html(htmla);
    	    
	    $('#resultFooter').smartpaginator({
	        datacontainer: 'questionAnswers',
	        dataelement:'tr',
	    	totalrecords: totRecords,
	    	recordsperpage: 6,
	    	theme: 'teal',
		 	length: 4,
		 	next: 'Next',
		 	prev: 'Prev',
		 	first: 'First',
		 	last: 'Last'
	    });
    }
    else
    {
		 $("#resultFooter").html("");
		 $("#resultFooter").removeClass("pager red");
		 $("#questionAnswers").html("<p>No Results To Display</p>");
    }
}

function test(id)
{
	$("img.closeButton").click(function(){
                //id = $(this).parent().attr("id");
                $.ajax({
                        type: "POST",
                        data: "id="+id,
                        url: "python/deletemsg.wsgi",
                        success: function(msg){
                                jQuery(this).parent().remove();
                        }
                });

        });

		$("#displayMessage_"+id).css("display","none");
	
}
