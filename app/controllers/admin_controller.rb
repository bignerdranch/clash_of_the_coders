class AdminController < ApplicationController
  before_filter :verify_admin!

  def verify_admin!
    ['aaron@bignerdranch.com',
      'charlietanksley@bignerdranch.com'].include?(current_user.email)
  end
end
