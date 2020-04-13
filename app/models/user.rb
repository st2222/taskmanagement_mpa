class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  has_many :to_friend_id, class_name: "Friend", foreign_key: 'to_friend_id'
  has_many :from_friend_id, class_name: "Friend", foreign_key: 'from_friend_id'
end
