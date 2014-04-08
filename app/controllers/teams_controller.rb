class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    team = CreateTeam.run(create_params)
    if team.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def create_params
    params.require(:team).permit(:name)
  end
end
