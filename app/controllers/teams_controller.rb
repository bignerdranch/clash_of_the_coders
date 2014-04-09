class TeamsController < ApplicationController
  def create
    team = CreateTeam.run(create_params)
    if team.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @teams = Team.for_current_year
  end

  def new
    @team = Team.new
  end

  private

  def create_params
    params.require(:team).permit(:name)
  end
end
