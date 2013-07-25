class ProjectsController < ApplicationController

before_filter :find_topic
before_filter :find_project, :only => [:show, :edit, :update, :destroy]
def new
    @project = @topic.projects.build
  end

  def create
    @project = @topic.projects.build(params[:project])
  if @ticket.save
    flash[:notice] = "Project has been created."
    redirect_to [@topic, @project]
  else
    flash[:alert] = "Project has not been created."
    render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
  if @project.update_attributes(params[:project])
    flash[:notice] = "Project has been updated."
    redirect_to [@topic, @project]
  else
    flash[:alert] = "Project has not been updated."
    render :action => "edit"
  end
end

  def destroy
    @ticket.destroy
    flash[:notice] = "Project has been deleted."
    redirect_to @topic
  end

private
  def find_topic
    @topic = Topic.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The topic you were looking " +
                    "for could not be found."
    redirect_to root_path
  end

  def find_project
    @project = @topic.projects.find(params[:id])
  end
end
