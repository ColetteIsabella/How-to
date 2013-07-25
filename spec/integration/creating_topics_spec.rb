require 'spec_helper'

feature 'Creating Topics' do
  before do
    visit '/'
    click_link 'New Topic'
  end
  scenario "can create topic" do
    fill_in 'Name', :with => 'Molly'
    click_button 'Create Topic'
    page.should have_content('Topic has been created.')

    topic = Topic.find_by_name("Molly")
    page.current_url.should == topic_url(topic)
    title = "Molly - Topics - Crafty"
    find("title").should have_content(title)
  end

  scenario "can not create a topic without a name" do
    click_button "Create Topic"
    page.should have_content("Topic has not been created")
    page.should have_content("Name can't be blank")
  end
end
