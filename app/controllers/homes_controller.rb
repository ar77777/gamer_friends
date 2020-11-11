class HomesController < ApplicationController
  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = '1q2w3e'
      user.nickname = 'ゲスト'
      user.sex_id = 2
      user.age_id = 2
    end
    sign_in user
    redirect_to posts_path
  end
end