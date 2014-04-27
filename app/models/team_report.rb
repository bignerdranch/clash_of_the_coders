require 'active_support/core_ext/integer/inflections'
require 'team_score_calculator'

class TeamReport < SimpleDelegator
  def initialize(team: nil, score_calculator: TeamScoreCalculator)
    @score_calculator = score_calculator
    super(team)
  end

  def score
    score_calculator.for(self)
  end

  private
  attr_reader :score_calculator
end
