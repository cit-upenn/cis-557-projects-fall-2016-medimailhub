Feature: User in the log in page
		 As a registered user
		 I want to log in with my Email and Password


	Scenario: log in with valid credentials
		Given I have set up the user database
		And I'm in the user log in page
		When I fill the credentials and log in 
		Then I should be able to log in successfully 


	Scenario: log in with wrong username or password
		Given I have set up the user database
		And I'm in the user log in page
		When I fill the wrong username or password 
		Then I should not be able to log in

	