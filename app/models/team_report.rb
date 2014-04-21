require 'active_support/core_ext/integer/inflections'

class TeamReport < SimpleDelegator
  def initialize(team: nil, position: nil)
    @position = position
    super(team)
  end

  def position
    score? ? '' : @position.ordinalize
  end

  def score
    raw_score || 0
  end

  private

  def score?
    raw_score.nil?
  end
end
