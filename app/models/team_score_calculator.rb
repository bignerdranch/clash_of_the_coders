class TeamScoreCalculator
  BONUS_SCORE = 7

  def self.for(team)
    new(team).score
  end

  attr_reader :team

  def initialize(team)
    @team = team
  end

  def score
    base_score + bonus
  end

  private

  def base_score
    team.raw_score || 0
  end

  def bonus
    team.bonus? ? BONUS_SCORE : 0
  end
end
