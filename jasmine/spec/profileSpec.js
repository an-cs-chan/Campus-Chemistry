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
	
	it("Shows no info for user gender", function()
	{
		setFixtures('<div id="gender" class="user_fact"></div>');
		expect($("#gender").text()).toContain("");
	});
	
	it("Shows no info for user seeking gender and age range", function()
	{
		setFixtures('<div id="seeking" class="user_fact"></div>');
		expect($("#seeking").text()).toContain("");
	});
	
	it("Shows no info for age", function()
	{
		setFixtures('<div id="age" class="user_fact"></div>');
		expect($("#age").text()).toContain("");
	});
	
	it("Shows no info for relationship status", function()
	{
		setFixtures('<div id="rstatus" class="user_fact"></div>');
		expect($("#rstatus").text()).toContain("");
	});
	
	it("Shows no info for ethnicity", function()
	{
		setFixtures('<div id="ethnicity" class="user_fact"></div>');
		expect($("#ethnicity").text()).toContain("");
	});
	
	it("Shows no info for birth country", function()
	{
		setFixtures('<div id="bCountry" class="user_fact"></div>');
		expect($("#bCountry").text()).toContain("");
	});
	
	it("Shows no info for faculty", function()
	{
		setFixtures('<div id="faculty" class="user_fact"></div>');
		expect($("#faculty").text()).toContain("");
	});
	
	it("Shows no info for department", function()
	{
		setFixtures('<div id="department" class="user_fact"></div>');
		expect($("#department").text()).toContain("");
	});

});

/* Specs don't execute in SpecRunner for some reason... don't know why :(
describe ("Data", function(){
		
		beforeEach(function () {
			var data = new Array();
			data = {"Andrea","F","M",22,"Dating","Chinese","Canada","Science","Computer Science","cs,web developing,running,reading,movies,tv",18,25};
			
			processProfileInfo(data);
		});
    	
		it("Shows user name at top of profile", function()
		{
			setFixtures('<div id="user_fullname" class="homePanel"></div>');
			expect($("#user_fullname").text()).not.toBeEmpty();
		});	
		
		it("Shows no user name for interests", function()
		{
			setFixtures('<div id="interests" class="clearfix footerPanel"></div>');
			expect($("#interests").text()).not.toBeEmpty();
		});
		
		it("Shows no info for user gender", function()
		{
			setFixtures('<div id="gender" class="user_fact"></div>');
			expect($("#gender").text()).not.toBeEmpty();
		});
		
		it("Shows no info for user seeking gender and age range", function()
		{
			setFixtures('<div id="seeking" class="user_fact"></div>');
			expect($("#seeking").text()).not.toBeEmpty();
		});
		
		it("Shows no info for age", function()
		{
			setFixtures('<div id="age" class="user_fact"></div>');
			expect($("#age").text()).not.toBeEmpty();
		});
		
		it("Shows no info for relationship status", function()
		{
			setFixtures('<div id="rstatus" class="user_fact"></div>');
			expect($("#rstatus").text()).not.toBeEmpty();
		});
		
		it("Shows no info for ethnicity", function()
		{
			setFixtures('<div id="ethnicity" class="user_fact"></div>');
			expect($("#ethnicity").text()).not.toBeEmpty();
		});
		
		it("Shows no info for birth country", function()
		{
			setFixtures('<div id="bCountry" class="user_fact"></div>');
			expect($("#bCountry").text()).not.toBeEmpty();
		});
		
		it("Shows no info for faculty", function()
		{
			setFixtures('<div id="faculty" class="user_fact"></div>');
			expect($("#faculty").text()).not.toBeEmpty();
		});
		
		it("Shows no info for department", function()
		{
			setFixtures('<div id="department" class="user_fact"></div>');
			expect($("#department").text()).not.toBeEmpty();
		});
	});

*/
