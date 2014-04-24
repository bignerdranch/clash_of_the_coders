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
      User.find_by_id(session[:user_id]) ||
      NullUser.new
  end
  helper_method :current_user

  def current_user=(user)
    session[:user_id] = user.id
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

  class NullUser
    def persisted?
      false
    end
  end
end
