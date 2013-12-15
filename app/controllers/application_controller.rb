class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def home
    render 'posts/home'
  end
  
  def grab_dadi
    Post.grab_dadi
    redirect_to controller: 'posts', action: 'index'
  end
end
