class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate!

  def index
  end

  private

  def authenticate!
    redirect_to '/auth/stable' unless current_user.persisted?
  end

  def current_user
    @current_user ||=
      User.find(session[:user_id]) ||
      NullUser.new
  end
  helper_method :current_user

  def current_user=(user)
    session[:user_id] = user.id
  end

  class NullUser
    def persisted?
      false
    end
  end
end
