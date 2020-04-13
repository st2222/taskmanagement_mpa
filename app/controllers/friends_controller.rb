class FriendsController < ApplicationController

  def index
    @friends = Friend.friends_list(current_user) 
  end


  def friend_request
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
      @friend.status = 2
      puts @friend
      @friend.save
    end
    redirect_to tasks_path
  end
end
