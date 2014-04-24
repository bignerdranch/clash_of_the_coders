class ScorecardsController < ApplicationController
  def create
    @scorecard = Scoring::Form.new(scores: create_params,
      teams: teams,
      user: current_user)

    if @scorecard.persist
      flash.now[:notice] = 'Your scores have been recorded.'
      redirect_to scoreboards_path
    else
      flash.now[:alert] = 'Something went wrong.'
      render :new
    end
  end

  def new
    @scorecard = Scoring::Form.new(teams: teams)
  end

  def show
    @scorecard_report = Scoring::Report.new(teams: teams,
      user: current_user)
  end

  private

  def create_params
    params.require(:scores).first
  end

  def teams
    @teams ||= Team.for_current_year
  end
end
