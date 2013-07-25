require 'spec_helper'

feature 'Deleting projects' do
  let!(:topic) { Factory(:topic) }
  let!(:project) { Factory(:project, :topic => topic) }

  before do
    visit '/'
    click_link topic.name
    click_link project.title
end
  scenario "Deleting a project" do
    click_link "Delete Project"
    page.should have_content("Project has been deleted.")
    page.current_url.should == topic_url(topic)
  end
end
