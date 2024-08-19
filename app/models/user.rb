class User < ApplicationRecord
  validates :username, presence: true, length: { minimum:3 }
  validates :password, presence: true, length: {minimum:5}
  validates :profile_name, presence: true, length: {minimum:3}
  validates :description, presence: true, length: {minimum:1}
end
