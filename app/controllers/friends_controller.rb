class FriendsController < ApplicationController
  #status 1 => 申請中
  #status 2 => 友達

  def index
    @friends = Friend.friends_list(current_user) 
  end


  def friend_request
    #申請中ならステータスを1にする
    if Friend.find_by(from_friend_id: current_user.id, to_friend_id: params[:to_user]) == nil
      Friend.create!(from_friend_id: current_user.id, to_friend_id: params[:to_user], status: 1)
    end
    redirect_to tasks_path
  end


  def request_list
    @friends = Friend.where(from_friend_id: current_user.id).where(status: 1).order(created_at: "DESC")
  end


  def requested_list
    @friends = Friend.where(to_friend_id: current_user.id).where(status: 1).order(created_at: "ASC")
  end


  def approve
    @friend = Friend.find_by(from_friend_id: params[:from_friend_id], to_friend_id: params[:to_friend_id])
    if @friend == nil
    else
      #申請処理をしたらステータスを２にする
      @friend.status = 2
      puts @friend
      @friend.save
    end
    redirect_to tasks_path
  end
end
