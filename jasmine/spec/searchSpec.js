describe("CreateUserBlock", function() {
	it("should create a block of HTML with the users information", function()
	{
		//To make sure our HTML is returned properly, we create a DOM object to append our results to
		setFixtures('<div id="test"></div>');
		
		//Do the function and append the HTML
		$("#test").append(createUserBlock("Melissa", 21, "Computer Science", 512, "right", 1));
		
		//Do our tests
		expect($("#userNameText").html()).toBe("Melissa");
		expect($("#userAgeText").html()).toBe('21');
		expect($("#userFacultyText").html()).toBe('Computer Science');

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
		
		processAdvancedSearch(data);

		expect($("#resultsFooter").html()).toBe("");
		expect($("#resultsArea").html()).toBe("<p>No Results To Display</p>");
	});	
	
	it("Shows results when there IS data", function()
	{
		setFixtures('<div id="resultsArea"></div><div id="resultsFooter"></div>');

		var data = new Array();
		data[0] = "test";
		
		processAdvancedSearch(data);

		expect($("#resultsFooter").html()).toBe("");
		expect($("#resultsArea").html()).not.toBeEmpty();
	});		
});

