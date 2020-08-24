class FriendshipsController < ApplicationController
  def create
    # @friend = Friendship.create(user_id: user_id, friend_id: friend_id)
    current_user.requests_sent.create(friend_id: params[:user_id], acceptance_status: 'pending')
    # redirect_to @users
  end

  def destroy; end

  def update; end
end
