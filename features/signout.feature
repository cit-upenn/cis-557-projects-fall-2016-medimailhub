Feature: User in the launchpad
         As a registered user
		 I want to logout


Scenario: User sign out
		Given I have set up the user database
		And I'm in the user log in page
		And I fill the credentials and log in
		When click the log out
		Then I should be able to sign out 