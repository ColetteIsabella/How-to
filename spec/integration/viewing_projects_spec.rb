require 'spec_helper'
  feature "Viewing projects" do
    before do
      molly = Factory(:project, :name => "Molly")
      Factory(:project,
              :topic => molly,
              :title => "She's so tiny!",
              :description => "With a goatee and an eyepatch!")
    patrick = Factory(:topic, :name => "Patrick")

    Factory(:project,
              :topic => patrick,
              :title => "Russian Blue",
              :description => "He's a little grumpy.")
    visit '/'
  end
  scenario "Viewing projects for a given topic" do
    click_link "Patrick"
    page.should have_content("She's so tiny!")
    page.should_not have_content("Russian Blue")
    click_link "She's so tiny!"
    within("#project h2") do
      page.should have_content("She's so tiny!")
    end
    page.should have_content("With a goatee and an eyepatch!")
  end
end
