class HomesController < ApplicationController
  def top
  end

  def about
  end
  
  def mypage
    @following_users = current_user.following_user
    @follower_users = current_user.follower_user
  end
end
