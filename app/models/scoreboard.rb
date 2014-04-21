class Scoreboard
  def self.for_year(year)
    new(year)
  end

  def initialize(year: year)
    @year = year
  end

  def scores
    @scores ||= fetch_scores
  end

  def score(id)
    scores.fetch(id).to_f
  end

  private
  attr_reader :year

  def fetch_scores
    CompetitionYear.where(year: year)
      .joins(:teams)
      .joins(teams: :scores)
      .group(:team_id)
      .average(:value)
  end
end
