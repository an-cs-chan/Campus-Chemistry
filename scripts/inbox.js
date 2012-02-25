$(document).ready(function() {


	processMessage();
    //var htmlStr = $('a#opener').live(html());
	//alert("htmlStr");
	var $dialog = $('<div></div>').html("Your Message")
			.dialog({
				autoOpen: false,
				title: 'Subject'
			});

			$('a#opener').live("click", function() {
			$dialog.dialog('open');
			// prevent the default action, e.g., following a link
			return false;
			});
			
	/*$('tbody tr[data-href]').addClass('clickable').click(function() { 
			window.location = $(this).attr('data-href'); 
		}).find('a').hover( function() { 
			$(this).parents('tr').unbind('click'); 
		}, function() { 
			$(this).parents('tr').click( function() { 
				window.location = $(this).attr('data-href'); 
			}); 
		}); */
	                 

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
      htmla += "<tr class='even' data-href=''>" + 
				"<td><input type='checkbox' name='vehicle' value='Bike' /></td>" +
				"<td><a id='opener' href='#'>" + data[index][2] + "</a></td>" + 
				"<td>" + data[index][1] + "</td>" + 
				"<td>" + data[index][3] + "</td>" + 
				"<td><a href='#'>Delete</a></td>" + 
			"</tr>";
			totRecords++;
    });
	
	htmla += "</tbody>" +
	        "</table>";
        
    if(totRecords > 0)
    {
    	$("#questionAnswers").html(htmla);
    	    
	    $('#resultFooter').smartpaginator({
	        datacontainer: 'questionAnswers',
	        dataelement:'div',
	    	totalrecords: totRecords,
	    	recordsperpage:6,
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



/*function test(id)
{
	$("#displayUser_"+id).css("display","none");
}*/
