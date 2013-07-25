require 'spec_helper'

describe TopicsController do
it "displays an error for a missing topic" do
  get :show, :id => "not-here"
  response.should redirect_to(topics_path)
  message = "The topic you were looking for could not be found."
  flash[:alert].should == message
  end
end
