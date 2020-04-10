class TaskBranchesController < ApplicationController
  def create
    @task_branch = TaskBranch.new(task_branch_parameter)
    last_branch = TaskBranch.where(task_id: params[:task_id].to_s).order(:branch_id).last

    puts last_branch
    if last_branch != nil
      @task_branch.branch_id = last_branch.branch_id + 1
    else
      @task_branch.branch_id = 1
    end
    @task_branch.save!
    render json: TaskBranch.where(task_id: params[:task_id].to_s, branch_id: @task_branch.branch_id)
  end
  def index

    render json: TaskBranch.where(task_id: params[:task_id].to_s).order(:branch_id)
  end

  def task_branch_parameter
    params.require(:task_branch).permit(:task_id, :content)
  end
end
