And(/^I'm on the contacts page$/) do
	click_link "Contacts"
end

Given(/^I click on all Physicians$/) do
	click_link "All Physicians"
end

When(/^I add the user$/) do
  find(:xpath, "//tr[td[contains(.,'User2')]]/td/a", :text => '').click
end

Then(/^my contact list should be updated$/) do
  assert page.has_content?("Your contacts have been updated")
end

When(/^I click the delete contact button$/) do
	find(:xpath, "//tr[td[contains(.,'User2')]]/td/a", :text => 'delete').click	
end

Then(/^the contact should be removed from my contact list$/) do
  assert page.has_content?("has been removed from your contacts")
end

When(/^I click the make a call button$/) do
  find(:xpath, "//tr[td[contains(.,'User2')]]/td/a", :text => 'call').click
end

When(/^I click the message button$/) do
  find(:xpath, "//tr[td[contains(.,'User2')]]/td/a", :text => 'message').click
end
		
Then(/^A web chat should be initiated$/) do
  assert page.find("#publisher")
end
Then(/^the compose page should open$/) do
  assert page.has_content?("Compose")
end
Then(/^End call$/) do
  page.find("#end_call").click
end

