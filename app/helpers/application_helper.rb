module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  def check_friendship(user, current_user)
    @friend = user
    @friendship = Friendship.find_by(user: current_user, friend: user) ||
                  Friendship.find_by(user: user, friend: current_user)
    friendship = @friendship
    return '' if current_user == @friend

    if friendship
      check_friend_status(friendship)
    else
      render 'users/add_friend'
    end
  end

  def check_friend_status(friendship)
    if friendship.acceptance_status == 'pending' && friendship.user == current_user
      render 'users/pending'
    elsif friendship.acceptance_status == 'confirmed'
      render 'users/friends'
    elsif friendship.acceptance_status == 'pending' && friendship.friend == current_user
      render 'users/confirm_friend'
    end
  end
end
