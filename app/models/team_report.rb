require 'active_support/core_ext/integer/inflections'
require 'team_score_calculator'

class TeamReport < SimpleDelegator
  def initialize(team: nil, position: nil, score_calculator: TeamScoreCalculator)
    @position = position
    @score_calculator = score_calculator
    super(team)
  end

  def position
    score? ? '' : @position.ordinalize
  end

  def score
    score_calculator.for(self)
  end

  private

  attr_reader :score_calculator

  def score?
    raw_score.nil?
  end
end
