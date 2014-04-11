class TeamsController < ApplicationController
  def create
    team = CreateTeam.run(create_params)
    if team.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @team = find_team(show_params)
  end

  def index
    @teams = Team.for_current_year
  end

  def new
    @team = Team.new
  end

  def show
    @team = find_team(show_params)
  end

  def update
    @team = find_team(show_params)
    if @team.update(update_params)
      redirect_to team_path(@team)
    else
      render :edit
    end
  end

  private

  def available_users
    User.available
  end
  helper_method :available_users

  def create_params
    params.require(:team).permit(:description,
      :homepage,
      :name,
      member_ids: [])
  end

  def find_team(id)
    Team.for_current_year.find(id)
  end

  def show_params
    params.require(:id)
  end

  def update_params
    create_params
  end
end
