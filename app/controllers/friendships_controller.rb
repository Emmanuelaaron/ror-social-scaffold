class FriendshipsController < ApplicationController
  def create
    current_user.requests_sent.create(friend_id: params[:user_id], acceptance_status: 'pending')
    redirect_to users_path
  end

  def destroy
    # byebug
    # current_user.requests_received.find_by(friend_id: params[:user_id]).destroy
    @friendship = Friendship.find_by(user_id: params[:user_id])
    @friendship.destroy
    redirect_to users_path
  end

  def update
    @friendship = Friendship.find_by(user_id: params[:user_id])
    @friendship.update(acceptance_status: 'confirmed')
    redirect_to users_path
  end
end
