class Friend < ApplicationRecord
  self.primary_key = %i[to_friend_id from_friend_id]
  belongs_to :to_friend, class_name: 'User', foreign_key: 'to_friend_id'
  belongs_to :from_friend, class_name: 'User', foreign_key: 'from_friend_id'

  def self.friends_list(current_user)
    tmp_friends = Friend.where(from_friend_id: current_user.id)
      .or(Friend.where(to_friend_id: current_user.id))
      .where(status: 2).order(created_at: "DESC")
    from_friend = tmp_friends.select { |e| e.to_friend == current_user }.map { |e| e.from_friend }  
    to_friend = tmp_friends.select { |e| e.from_friend == current_user }.map { |e| e.to_friend }
    from_friend.concat(to_friend)
  end

end
