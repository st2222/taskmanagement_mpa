class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!
  def index
    @tasks = Task.where(user_id: current_user.id)
             .or(Task.where(value1: current_user.id))
  end

  def list
    #TODO 直近順にする
    @tasks = Task.where(user_id: current_user.id)
             .or(Task.where(value1: current_user.id))
  end

  def show
    @task_branches = TaskBranch.where(task_id: @task.id, user_id: current_user.id)
  end

  def new
    date = params[:date]
    @friends = Friend.friends_list(current_user)
    @task = Task.new(start_time: date, end_time: date, user_id: current_user.id)
  end
  def create
    task = Task.create!(task_parameter)
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
    @task = Task.where(user_id: current_user.id)
      .or(Task.where(value1: current_user.id)).find(params[:id])
  end

  def task_parameter
    params.require(:task).permit(:title, :content, :importance, :urgency, :image_id, :start_time, :end_time, :user_id, :value1, :value2)
  end
end
