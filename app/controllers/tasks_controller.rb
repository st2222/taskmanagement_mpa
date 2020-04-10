class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!
  def index
    @tasks = Task.all
  end

  def show
    @task_branches = TaskBranch.where(task_id: @task.id)
  end

  def new
    date = params[:date]
    @task = Task.new(start_time: date, end_time: date)
  end
  def create
    Task.create!(task_parameter)
    redirect_to tasks_path
  end

  def edit
  end
  def update
    if @task.update(task_parameter)
      redirect_to tasks_path, notice: "編集しました。"
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"削除しました。"
  end

  private 

  def find_task
    @task = Task.find(params[:id])
  end

  def task_parameter
    params.require(:task).permit(:title, :content, :importance, :urgency, :image_id, :start_time, :end_time, :value1, :value2)
  end
end
