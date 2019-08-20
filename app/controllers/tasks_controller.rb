class TasksController < ApplicationController
  before_action :fetch_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end
  def show
    # @task = Task.find(params[:id])
  end
  def new
    @task = Task.new
  end
  def create
    @task = Task.new(task_params)
    @task.save

    # Redirect to the index page
    redirect_to tasks_path
  end
  def edit
    # @task = Task.find(params[:id])
  end
  def update
    # @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to @task
  end
  def detroy
    # @task = Task.find(params[:id])
    @task.delete
    redirect_to tasks_path
  end

private

  def task_params
    params.require(:task).permit(:id, :title, :details, :completed)
  end

  def fetch_task
    @task = Task.find(params[:id])
  end

end
