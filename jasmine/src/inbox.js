$(document).ready(function() {

   	//getMessages();
	
	$(function() {
		$("#tabs").addClass('ui-tabs-vertical ui-helper-clearfix');
		$("#tabs li").removeClass('ui-corner-top').addClass('ui-corner-left');
	}); 

	$(function() {		
		$("#dialog:ui-dialog").dialog( "destroy" );
		    var name = $( "#name" ),
			message = $( "#message" ),
			allFields = $( [] ).add( name ).add( message ),
			tips = $( ".validateTips" );
		
			$( "#dialog-form" ).dialog({
				autoOpen: false,
				height: 370,
				width: 350,
				modal: true,
				buttons: 
				{
					"Send": function()
					{
						var bValid = true;
						
						allFields.removeClass( "ui-state-error" );
						$(".error").hide();
						
						var name = $("#name").val();
						var message = $("#message").val();
						
					    if(name == '') 
						{
					    	$("#name").after('<span class="error">*</span>');
					    	bValid = false;
					    } 
						if (message == '')
						{
							$("#message").after('<span class="error">*</span>');
					    	bValid = false;
						}					   				
						if ( bValid ) 
						{
							$.ajax({
									type: "POST",
									url: "python/send.wsgi",
									data: "name="+name+"&message="+message+"&userid="+userID,
							});
									
							$( this ).dialog( "close" );
							
							$("#alertArea").show("fast");
							$("#alertArea").text("Message sent to "+name+"!");
							$("#alertArea").delay(2000).hide("slow");							
						}
					},
					Cancel: function() 
					{
						allFields.removeClass( "ui-state-error" );
						$(".error").hide();						
						$( this ).dialog( "close" );
					}
				},
				close: function() 
				{
					allFields.val( "" ).removeClass( "ui-state-error" );
					$(".error").hide();	
				}
			});
		
		$("#compose").click(function() 
		{
			$( "#dialog-form" ).dialog( "open" );
		});
			
		$("#delete_button").click(function()
		{ 
			var ids = new Array();
			var i = 0;
			
			$("input:checked").each(function()
			{
				ids[i] = $(this).val();
				i++;
			});		
			
			var x = 0;
			
			for(x = 0; x < ids.length; x++)
			{
				deletemsg(ids[x]);
			}
			
			return false;
		 });	
	});
});


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
						"<th width=10%></th>" + 
						"</tr>" +
					"</thead>" +	
 				"<tbody>"; 
	
	//Code for showing messages in the table from the DB
	$.each(data, function(index) 
	{
		if(data[index][2] != null) // Clip the message
		{
		    if (data[index][2].length > 80)
			{
			 var newString = data[index][2].substring(0,80) + "...";
			}
			else
			{
			 var newString = data[index][2];
			}
		}
		
		var read = data[index][4]; 
		
		if ( read == 1 )
		{
		   htmla += "<tr id='displayMessage_" + data[index][0] + "' class='read' data-href=''>" + 
					"<td><input type='checkbox' class='check_select' name='message_id[]' value=" + data[index][0] + " /></td>" +
					"<td name = 'message'><a class='opener' id='"+index+"' href='#'>" + newString + "</a></td>" + 
					"<td name = 'from'>" + data[index][1] + "</td>" + 
					"<td name='time'>" + data[index][3] + "</td>" + 
					"<td><img class='closeButton' style='left: 18px; top: 0px' src='images/cancel.png' onclick='deletemsg("+data[index][0]+");' />" +
					"<img class='replybutton' style='left: 18px; top: 0px' src='images/reply.png' onclick='reply(\""+data[index][1]+"\");' /></td>" + 
				"</tr>";
		}
		else
		{
		   htmla += "<tr id='displayMessage_" + data[index][0] + "' class='even' data-href=''>" + 
					"<td><input type='checkbox' class='check_select' name='message_id[]' value=" + data[index][0] + " /></td>" +
					"<td name = 'message'><a class='opener' id='"+index+"' href='#'>" + newString + "</a></td>" + 
					"<td name = 'from'>" + data[index][1] + "</td>" + 
					"<td name='time'>" + data[index][3] + "</td>" + 
					"<td><img class='closeButton' style='left: 18px; top: 0px' src='images/cancel.png' onclick='deletemsg("+data[index][0]+");' />" + 
					"<img class='replybutton' style='left: 18px; top: 0px' src='images/reply.png' onclick='reply(\""+data[index][1]+"\");' /></td>" + 
				"</tr>";
		}
				
		totRecords++;
    });
	
	//Start of code for showing the message with Reply button.
	var $dialog=new Array();
	
	$.each(data, function(index)
	{
		$dialog[index] = $('<div style="background-color:#D6EEF7"></div>').html(data[index][2]).dialog({
				autoOpen: false,
				height: 300,
				width: 350,
				title: 'Message',
				modal: true,
			  	buttons: 
			  	{ 
			  		"Reply": function()
			  		{ 
				 	 	$(this).dialog('close');
						reply(data[index][1]);
				  	}
				}
			}); 
	});
	
    if(totRecords > 0)
	{	
		//code for opening the dialog with respective messages	
		$('.opener').live("click", function(event) 
		{          
				var match_id = $(this).attr("id");
				$dialog[match_id].dialog('open');
				return false;
		});
    }
	
	htmla += "</tbody>" +
	        "</table>";
        
    if(totRecords > 0)
    {
    	$("p#ptabs1").html(htmla);
    	
        $('div#resultFooter-1').smartpaginator({
	        datacontainer: 'div#ptabs1',
	        dataelement:'tr',
	    	totalrecords: totRecords,
	    	recordsperpage: 10,
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
		 $("div#resultFooter-1").html("");
		 $("div#resultFooter-1").removeClass("pager red");
		 $("p#ptabs1").html("<p>No Results To Display</p>");
    }
}

function showSentMessages(data)
{
	var htmls = "";	
	var totRecords2 = 0;
	var floatType = "";
	var starter = 1523;
	
	htmls = "<table class='sample'> " +
				"<thead><tr> " +
						"<th width=50%>Message</th>" +
						"<th width=15%>To</th>" + 
						"<th width=20%>Time</th>" + 
						"<th width=10%></th>" + 
						"</tr>" +
					"</thead>" +	
 				"<tbody>"; 
	
	$.each(data, function(index) 
	{  //Code for showing messages in the table from the DB
		if(data[index][2] != null)
		{
			// Clip the message
		    if (data[index][2].length > 80)
			{
				var newString = data[index][2].substring(0,80) + "...";
			}
			else
			{
				var newString = data[index][2];
			}
		}
		
		var read = data[index][4];
		
		if ( read == 1 )
		{
			htmls += 
				"<tr id='displayMessage_" + data[index][0] + "' class='read' data-href=''>" + 
					"<td name = 'message'><a class='opener2' id='"+index+"' href='#'>" + newString + "</a></td>" + 
					"<td name = 'from'>" + data[index][1] + "</td>" + 
					"<td name='time'>" + data[index][3] + "</td>" + 
					"<td><img class='closeButton' style='left: 18px; top: 0px' src='images/cancel.png' onclick='deletemsg("+data[index][0]+");' />" + 					
				"</tr>";
		}
		else
		{
		   htmls += 
		   		"<tr id='displayMessage_" + data[index][0] + "' class='even' data-href=''>" + 
						"<td name = 'message'><a class='opener2' id='"+index+"' href='#'>" + newString + "</a></td>" + 
						"<td name = 'from'>" + data[index][1] + "</td>" + 
						"<td name='time'>" + data[index][3] + "</td>" + 
					"<td><img class='closeButton' style='left: 18px; top: 0px' src='images/cancel.png' onclick='deletemsg("+data[index][0]+");' />" + 						
				"</tr>";
		}
			
		totRecords2++;
    });
	
	//Start of code for showing the message with Reply button.
	var $dialog = new Array();
	
	$.each(data, function(index)
	{
		$dialog[index] = $('<div style="background-color:#D6EEF7"></div>').html(data[index][2]).dialog({
				autoOpen: false,
				height: 300,
				width: 350,
				title: 'Message',
				modal: true,
			  	buttons: 
			  	{
			  		"Reply": function()
			  		{ 
				 		$(this).dialog('close');
						reply(data[index][1]);
				  	}
				 }
			}); 
	});
	
	if (totRecords2>0)
	{	
		//code for opening the dialog with respective messages
		$('.opener2').live("click", function(event) 
		{	
				var match_id = $(this).attr("id");
				$dialog[match_id].dialog('open');
				
				return false;
		});
    }
    
	htmls += "</tbody>" +
	        "</table>";
        
    // code for handling pagination
    if(totRecords2 > 0)
    {
    	$("p#ptabs2").html(htmls);
        $('div#resultFooter-2').smartpaginator({
	        datacontainer: 'ptabs2',
	        dataelement:'tr',
	    	totalrecords: totRecords2,
	    	recordsperpage: 10,
	    	theme: 'teal',
		 	length: 4,
		 	next: 'Next',
		 	prev: 'Prev',
		 	first: 'First',
		 	last: 'Last'
	    });
    }
    else // if no results
    {
		 $("div#resultFooter-2").html("");
		 $("div#resultFooter-2").removeClass("pager red");
		 $("p#ptabs2").html("<p>No Results To Display</p>");
    }
}

function reply (from)
{   
    $( "#dialog-form" ).dialog( "open" );
	$("#name").val(from);

	$("#dialog-form").dialog(
	{
		autoOpen: false,
		height: 350,
		width: 350,
		modal: true,
		buttons: 
		{
			"Send": function() 
			{
				var bValid = true;
				
				allFields.removeClass( "ui-state-error" );
				$(".error").hide();
				
				var name = $("#name").val();
				var message = $("#message").val();
				
				if(name == '') 
				{
					$("#name").after('<span class="error">*</span><br/><br/>');
					bValid = false;
				} 
				if (message == '')
				{
					$("#message").after('<span class="error">*</span>');
					bValid = false;
				}
			
			if ( bValid ) 
			{
					// we want to store the values from the form input box, then send via ajax below
					var name = $("#name").val(from); 
					var message = $("#message").val()
					
					$.ajax({
						type: "POST",
						url: "python/send.wsgi",
						data: "name="+name+"&message="+message+"&userid="+userID,
					});
							
					$( this ).dialog( "close" );
					
					$("#alertArea").show("fast");
					$("#alertArea").text("Message sent to "+name+"!");
					$("#alertArea").delay(2000).hide("slow");	
				}
			},
			Cancel: function() 
			{
				allFields.removeClass( "ui-state-error" );
				$(".error").hide();
				$( this ).dialog( "close" );
			}
		},
		close: function() 
		{
			allFields.removeClass( "ui-state-error" );
			$(".error").hide();
		}
	});
}

// code for deleting the message form UI and DB calls deletemsg.wsgi script
function deletemsg(id)
{
    $.ajax({
        type: "POST",
        data: "messageid="+id,
        url: "python/deletemsg.wsgi",
        success: function(msg){
                jQuery(this).parent().remove();
        }
    });
    
	$("#displayMessage_"+id).css("display","none");
}