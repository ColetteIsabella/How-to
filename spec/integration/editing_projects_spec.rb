require 'spec_helper'

feature "Editing projects" do
  let!(:topic) { Factory(:topic) }
  let!(:project) { Factory(:project, :topic => topic) }
  before do
    visit '/'
    click_link topic.name
    click_link project.title
    click_link "Edit Project"
end
  scenario "Updating a project" do
    fill_in "Title", :with => "Make it really shiny!"
    click_button "Update Project"
    page.should have_content "Project has been updated."
    within("#project h2") do
      page.should have_content("Make it really shiny!")
    end
    page.should_not have_content project.title
  end
  scenario "Updating a project with invalid information" do
    fill_in "Title", :with => ""
    click_button "Update Project"
    page.should have_content("Project has not been updated.")
  end
end
