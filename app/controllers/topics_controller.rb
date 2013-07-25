class TopicsController < ApplicationController
before_filter :find_topic, :only => [:show,
                                       :edit,
                                       :update,
                                       :destroy]
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params[:topic])
  if @topic.save
    flash[:notice] = "Topic has been created."
    redirect_to @topic
  else
    flash[:alert] = "Topic has not been created."
    render action: "new"
  end
end

  def show
  end

  def edit
  end

  def update
    if @topic.update_attributes(params[:topic])
    flash[:notice] = "Topic has been updated."
    redirect_to [@topic]
  else
    flash[:alert] = "Topic has not been updated."
    render :action => "edit"
  end
end

def destroy
  @topic.destroy
  flash[:notice] = "Topic has been deleted."
  redirect_to topics_path
end

private
  def find_topic
    @topic = Topic.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The topic you were looking" +
                    " for could not be found."
    redirect_to topics_path
  end
end
