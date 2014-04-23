class ScorecardsController < ApplicationController
  def create
  end

  def new
    @scorecard = Scoring::Form.new(teams: teams)
  end

  private

  def teams
    @teams ||= Team.for_current_year
  end
end
