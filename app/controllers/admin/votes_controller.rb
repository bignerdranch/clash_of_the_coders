class Admin::VotesController < AdminController
  def show
    @users = User.voted
  end
end
