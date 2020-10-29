class UsersController < ApplicationController
  
  PER = 16

  def show
    @user = User.find(params[:id])
  end

end