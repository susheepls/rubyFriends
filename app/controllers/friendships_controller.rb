class FriendshipsController < ApplicationController
  def post
    begin
      Friendship.create(user_id: current_user.id, friend_id: params[:id])
      redirect_to my_friends_path, notice: "Friend Added!"
    rescue
      redirect_to my_friends_path, notice: "YOU GUYS ARE ALREADY FRIENDS"
    end
  end

  def get
    @friend_list = Friendship.where(user_id: current_user.id).map do |friend|
      User.find(friend.friend_id)
    end
  end

  def destroy
    if Friendship.where(user_id: current_user.id, friend_id: params[:id]).destroy_all.any?
      redirect_to my_friends_path, notice: "Friend Removed!"
    else
      redirect_to my_friends_path, notice: "YOU ARE NOT FRIENDS TO BEGIN WITH"
    end
  end

end
