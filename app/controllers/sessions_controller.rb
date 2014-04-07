class SessionsController < ApplicationController
  skip_before_filter :authenticate!

  def create
    user = AuthenticatedUser.find(auth_credentials)
    self.current_user = user
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to unauthenticated_path
  end

  protected

  def auth_credentials
    AuthenticatedUser::StableAuth.new(request.env['omniauth.auth'])
  end
end
