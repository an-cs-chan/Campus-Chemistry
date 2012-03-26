describe("Profile Page", function() {
	
	describe ("No data", function(){
		
		beforeEach(function () {
	    	var data = new Array();
	    	//setting empty values for all the 12 attributes of the profile 
	    	for (var i=0; i<=12;i++){
	    		data.push(" ");
	    	}
	    	
			processProfileInfo(data);
	  	});
		
		it("Shows no user name at top of profile", function()
		{
			setFixtures('<div id="user_fullname" class="homePanel"></div>');
			expect($("#user_fullname").text()).toBe("");
		});	
		
		it("Shows no user name for interests", function()
		{
			setFixtures('<div id="interests" class="clearfix footerPanel"></div>');
			expect($("#interests").text()).toContain("");
		});
	
	});
	
});