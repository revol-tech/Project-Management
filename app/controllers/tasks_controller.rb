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

  def index
   @tasks = current_person.tasks
  end

  def edit
    @task = task_group.tasks.find(params[:id])
    @message = "Edit tasks for #{@task.title}"
    render 'new'
  end

  def update
    @task = task_group.tasks.find(params[:id])
    @task.update_attributes(params[:task])
    @task.save
    redirect_to task_group_path(task_group)
  end

  def destroy
    @task = task_group.tasks.find(params[:id])
    @task.destroy
    redirect_to task_group_path(task_group)
  end

  def toggle_complete
    @task = Task.find(params[:task_id])
    @task.complete = true
    @task.comment = "TODO"
    @task.save
    redirect_to tasks_path
  end
  private
  def task_group
    @task_group ||= TaskGroup.find(params[:task_group_id])
  end


end
