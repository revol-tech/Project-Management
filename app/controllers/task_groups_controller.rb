class TaskGroupsController < ApplicationController

  def new
    @project = Project.find_by_id(params[:project_id])
    @task_group = @project.task_groups.new
    @message = "Create a new task group for " + @project.title
  end

  def create
    @project = Project.find_by_id(params[:project_id])
    @task_group =  @project.task_groups.new(params[:task_group])
    if @task_group.save
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def update
    @project = Project.find_by_id(params[:project_id])
    @task_group = TaskGroup.find(params[:id])
    if @task_group.update_attributes(params[:task_group])
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find_by_id(params[:project_id])
    @task_group = @project.task_groups.find(params[:id])
    render 'new'
  end

  def destroy
    task_group = TaskGroup.find(params[:id])
    task_group.destroy
    redirect_to projects_path
  end

  def show
    @task_group = TaskGroup.find(params[:id])
  end

end
