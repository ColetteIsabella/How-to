require 'spec_helper'
feature "Editing Topics" do
  before do
    Factory(:topic, :name => "Molly")
    visit "/"
    click_link "Molly"
    click_link "Edit Topic"
  end

    scenario "Updating a topic" do
    fill_in "Name", :with => "Patrick"
    click_button "Update Topic"
    page.should have_content("Topic has been updated.")
  end
    scenario "Updating a topic with invalid attributes is bad" do
    fill_in "Name", :with => ""
    click_button "Update Topic"
    page.should have_content("Topic has not been updated.")
  end
end
