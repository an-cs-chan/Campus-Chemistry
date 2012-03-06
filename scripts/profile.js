	$(document).ready(function () {
		Page_Load();
	});


	function Page_Load(){
		$("#profilePicture").mouseover(function(){
			$("#uploadPic").css('visibility','visible');
			$("#uploadPic").attr('disabled','false');
		});
		
		$("#profilePicture").mouseout(function(){
			$("#uploadPic").css('visibility','hidden');
			$("#uploadPic").attr('disabled','true');
		});
					
	}
