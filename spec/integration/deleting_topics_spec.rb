require 'spec_helper'

feature "Deleting topics" do
  scenario "Deleting a topic" do
    Factory(:topic, :name => "Molly")
    visit "/"
    click_link "Molly"
    click_link "Delete Topic"
    page.should have_content("Topic has been deleted.")
visit "/"
    page.should_not have_content("Molly")
  end
end
