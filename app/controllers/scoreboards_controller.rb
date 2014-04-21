class ScoreboardsController < ApplicationController
  def show
    @scoreboard = Scoreboard.for_year(year)
  end

  private

  def year
    Date.current.year
  end
end
