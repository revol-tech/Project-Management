Given /^the following create_new_people:$/ do |create_new_people|
  CreateNewPerson.create!(create_new_people.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) create_new_person$/ do |pos|
  visit create_new_people_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following create_new_people:$/ do |expected_create_new_people_table|
  expected_create_new_people_table.diff!(tableish('table tr', 'td,th'))
end

Given /^I sleep for (\d+) seconds$/ do |arg1|
  sleep(10)
end


Given /^I select "([^"]*)" as "([^"]*)"$/ do |selector, value|
    select(value.to_s, :from => "#{selector}")
end

