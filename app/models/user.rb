class User < ApplicationRecord
  before_save :downcase_username
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
  validates :profile_name, presence: true, length: {minimum:3}
  validates :description, presence: true, length: {minimum:1}
  # has_many :primary_friends, class_name: "User", foreign_key: "user_one"
  # has_many :secondary_friends, class_name: "User", foreign_key: "user_two"
  has_many :friendships
  has_many :users, through: :friendships


  def downcase_email
    self.email = email.downcase
  end
end
