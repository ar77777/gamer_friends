class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:show, :destroy]
  
  PER = 16

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_path
  end

  private
  def current_user_check
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to posts_path
    end
  end

end