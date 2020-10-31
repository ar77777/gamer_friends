class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :sex_id, :age_id, :image])
  end

  def after_sign_in_path_for(resource) 
    posts_path
  end

  def set_search
    @search = Post.ransack(params[:q])
    @search_posts = @search.result.page(params[:page]).per(20).order(created_at: :desc)
  end
end