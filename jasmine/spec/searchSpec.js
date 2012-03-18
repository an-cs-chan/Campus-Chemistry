describe("CreateUserBlock", function() {
	it("should create a block of HTML with the users information", function()
	{
		//To make sure our HTML is returned properly, we create a DOM object to append our results to
		setFixtures('<div id="test"></div>');
		
		var testUser = new UserInformation("Melissa", "Computer Science", "", "Athletic", "Blah Blah...", "/test.img", "flowacat@shaw.ca");

		//Do the function and append the HTML
		$("#test").append(createUserBlock(testUser, 1, "smallDisplay"));
		
		//Do our tests
		expect($("#userNameText").html()).toBe("Melissa");

	});	
});

describe("ProcessBasicSearch", function() {
	it("Shows nothing when there is no data", function()
	{
		setFixtures('<div id="resultsArea"></div><div id="resultsFooter"></div>');

		var data = "";
		
		processBasicSearch(data);

		expect($("#resultsFooter").html()).toBe("");
		expect($("#resultsArea").html()).toBe("<p>No Results To Display</p>");
	});	
	
	it("Shows results when there IS data", function()
	{
		setFixtures('<div id="resultsArea"></div><div id="resultsFooter"></div>');

		var data = new Array();
		data[0] = "test";
		
		processBasicSearch(data);

		expect($("#resultsFooter").html()).toBe("");
		expect($("#resultsArea").html()).not.toBeEmpty();
	});		
});

describe("ProcessAdvancedSearch", function() {
	it("Shows nothing when there is no data", function()
	{
		setFixtures('<div id="resultsArea"></div><div id="resultsFooter"></div>');

		var data = "";
		
		processBasicSearch(data);

		expect($("#resultsFooter").html()).toBe("");
		expect($("#resultsArea").html()).toBe("<p>No Results To Display</p>");
	});	
	
	it("Shows results when there IS data", function()
	{
		setFixtures('<div id="resultsArea"></div><div id="resultsFooter"></div>');

		var data = new Array();
		data[0] = "test";
		
		processBasicSearch(data);

		expect($("#resultsFooter").html()).toBe("");
		expect($("#resultsArea").html()).not.toBeEmpty();
	});		
});

