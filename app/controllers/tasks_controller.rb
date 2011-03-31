class TasksController < ApplicationController
  def new
    @task = task_group.tasks.new
    @message = "Create a new task for #{@task_group.title}"
  end

  def create
    @task = task_group.tasks.new(params[:task])
    puts params[:task].to_s
    if @task.save
      redirect_to task_group_path(task_group)
    else
      render 'new'
    end
  end

  def show
   @task_grp =TaskGroup.find(params[:task_group_id])
   @task = @task_grp.tasks.find(params[:id])
   @task.change_status
   redirect_to(task_group_path(@task_grp))
  end

  def edit
    @task = task_group.tasks.find(params[:id])
    @message = "Edit tasks for #{@task.title}"
  end

  def update
    @task = task_group.tasks.find(params[:id])
    @task.update_attributes(params[:task])
    @task.save
    #render :text => params[:task].to_s
    redirect_to task_group_path(task_group)
  end

  def destroy
  end


  private
  def task_group
    @task_group ||= TaskGroup.find(params[:task_group_id])
  end


end
