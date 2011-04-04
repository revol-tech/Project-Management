class ProjectsController < ApplicationController

  before_filter :authenticate_person!
  def index
    @projects = current_person.projects
  end

  def new
    @project = current_person.projects.build
    @message = "New Project"
  end

  def create
    @project = current_person.projects.new(params[:project])
    if @project.save
      flash[:notice] = "Project Successfully Created"
      redirect_to projects_path
    else
      @message = "New Project"
      render 'new'
    end
  end

  def update
    @project = current_person.projects.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to projects_path
    else
      @message = "Edit#{@project.title}"
      render 'new'
    end
  end

  def edit
    @project = current_person.projects.find(params[:id])
    @message = "Edit#{@project.title}"
    render 'new'
  end

  def destroy
    project = current_person.projects.find(params[:id])
    project.destroy
    flash[:notice] = "Project Scrapped"
    redirect_to projects_path
  end

  def show
    @project = current_person.projects.find(params[:id])
  end

end
