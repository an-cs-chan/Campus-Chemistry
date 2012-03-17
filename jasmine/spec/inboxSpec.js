describe("Shows Messages in Inbox", function() {
	it("Shows nothing when there is no data", function()
	{
		setFixtures('<p id="ptabs1"></div><div id="resultsFooter-1"></div>');
		var data = 0;			
		
		showMessage(data);

		expect($("#resultsFooter-1").html()).toBe("");
		expect($("#ptabs1").html()).toBe("<p>No Results To Display</p>");
	});	
	
	it("Shows the messages received by the user", function()
	{
		//To make sure our HTML is returned properly, we create a DOM object to append our results to
		setFixtures('<p id="ptabs1"></div><div id="resultsFooter-1"></div>');
		var data = new Array();
		data[0] = "test";
		
		showMessage(data);

		expect($("#resultsFooter-1").html()).toBe("");
		expect($("#ptabs1").html()).not.toBeEmpty();
	});	
});

describe("Shows Sent Messages", function() {
	it("Shows nothing when there is no data", function()
	{
		setFixtures('<p id="ptabs2"></div><div id="resultsFooter-2"></div>');

		var data = "";
		
		showSentMessages(data);

		expect($("#resultsFooter-2").html()).toBe("");
		expect($("#ptabs2").html()).toBe("<p>No Results To Display</p>");
	});	
	
	it("Shows messages sent by the user", function()
	{
		setFixtures('<p id="ptabs2"></div><div id="resultsFooter-2"></div>');

		var data = new Array();
		data[0] = "test";
		
		showSentMessages(data);

		expect($("#resultsFooter-2").html()).toBe("");
		expect($("#ptabs2").html()).not.toBeEmpty();
	});		
});

