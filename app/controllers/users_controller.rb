class UsersController < ApplicationController

  def search
    from_friends = Friend.where(from_friend_id: current_user.id).where(status: 2).map { |e| e.from_friend_id }
    to_friends = Friend.where(to_friend_id: current_user.id).where(status: 2).map { |e| e.from_friend_id }
    from_friends_request = Friend.where(from_friend_id: current_user.id).where(status: 1).map { |e| e.from_friend_id }
    to_friends_requested = Friend.where(to_friend_id: current_user.id).where(status: 1).map { |e| e.from_friend_id }
    @users_h = {}
    @users = User.where("name LIKE ?", "%" + params[:search_word]+ "%")
      .or(User.where("email LIKE ?", "%params[:search_word]%"))
      .where.not(id: current_user.id)
      .map do |e|
      if from_friends_request.include? e.id or to_friends_requested.include? e.id
        @users_h[e] = 2
      elsif from_friends.include? e.id or to_friends.include? e.id
        @users_h[e] = 1
      else
        @users_h[e] = 0
      end
    end
    @users_h 
  end

  def show
  end
end
