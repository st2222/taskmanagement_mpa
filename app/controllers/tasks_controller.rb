class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!
  def index
    @tasks = Task.where(user_id: current_user.id)
      .or(Task.where(id: TaskShare.where(user1_id: current_user.id)
      .or(TaskShare.where(user2_id: current_user.id)).map { |e| e.task_id} ))
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
    friend = friend_parameter[:friend]
    
    task = Task.create!(task_parameter)
    if friend != nil
      TaskShare.create!(task_id: task.id, user1_id: current_user.id, user2_id: friend)
    end
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
    @task = Task.where(user_id: current_user.id).or(Task.where(id: TaskShare.where(user2_id: current_user.id).map{|e| e.task_id})).find(params[:id])
  end

  def task_parameter
    params.require(:task).permit(:title, :content, :importance, :urgency, :image_id, :start_time, :end_time, :user_id, :value1, :value2)
  end
  def friend_parameter
    params.require(:task).permit(:friend)
  end
end
