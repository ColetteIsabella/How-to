require 'spec_helper'
feature "Viewing Topics" do
  scenario "Listing all topics" do
    topic = Factory.create(:topic, :name => "Molly")
    visit '/'
    click_link 'Molly'
    page.current_url.should == topic_url(topic)
  end
end
