class User < ApplicationRecord
  validates :username, presence: true, length: { minimum:3 }
  validates :password, presence: true, length: {minimum:5}
  validates :profile_name, presence: true, length: {minimum:3}
  validates :description, presence: true, length: {minimum:1}
  # has_many :primary_friends, class_name: "User", foreign_key: "user_one"
  # has_many :secondary_friends, class_name: "User", foreign_key: "user_two"
  has_many :friendships
  has_many :users, through: :friendships
end
