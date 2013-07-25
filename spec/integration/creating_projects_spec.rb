require 'spec_helper'

feature "Creating Projects" do
  before do
    Factory(:topic, :name => "Sophie")
    visit '/'
    click_link "Sophie"
    click_link "New Project"
end
  scenario "Creating a project" do
    fill_in "Title", :with => "The Dog"
    fill_in "Description", :with => "Dogs are complicated!"
    click_button "Create Project"
    page.should have_content("Project has been created.")
  end

  scenario "Creating a project without valid attributes fails" do
    click_button "Create Project"
    page.should have_content("Project has not been created.")
    page.should have_content("Title can't be blank")
    page.should have_content("Description can't be blank")
  end

    scenario "Direction must be descriptive" do
    fill_in "Title", :with => "The Dog"
    fill_in "Direction", :with => "she was hyper"
    click_button "Create Project"
    page.should have_content("Project has not been created.")
    page.should have_content("Direction is too boring")
  end
end
