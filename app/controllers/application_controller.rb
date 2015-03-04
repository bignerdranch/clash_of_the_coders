class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate!

  def index
  end

  private

  def authenticate!
    dynamically_set_current_user and return if dynamic_users?
    redirect_to '/auth/stable' unless current_user.persisted?
  end

  def current_user
    @current_user ||=
      User.find_by_id(session[:user_id]) ||
      NullUser.new
  end
  helper_method :current_user

  def current_user=(user)
    session[:user_id] = user.id
  end

  def dynamically_set_current_user
    if user_params.present?
      session[:user_id] = user_params[:user_id]
      current_user
    end
  end

  def scorecard_link
    if scorecard_complete?
      scorecard_path
    else
      new_scorecard_path
    end
  end
  helper_method :scorecard_link

  def scorecard_link_text
    if scorecard_complete?
      'Your Votes'
    else
      'Vote'
    end
  end
  helper_method :scorecard_link_text

  def scorecard_complete?
    Scoring::Complete.check?(year: Date.current.year, user: current_user)
  end

  def dynamic_users?
    ENV['DYNAMIC_USERS'].present?
  end
  helper_method :dynamic_users?

  def user_params
    params.permit(:user_id)
  end

  class NullUser
    def persisted?
      false
    end

    def id
      :no_id
    end
  end
end
