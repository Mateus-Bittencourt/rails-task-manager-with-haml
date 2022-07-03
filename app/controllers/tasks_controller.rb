class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "Task successfully created"
      redirect_to @task
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def task_params
    params.require(:task).permit(:title, :details)
  end


end
