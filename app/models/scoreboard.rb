class Scoreboard
  def self.for_year(year)
    new(year: year)
  end

  attr_reader :year
  def initialize(year: year)
    @year = year
  end

  def teams
    @teams ||= Team.for_year(year)
      .sort { |a,b| score(b) <=> score(a) }
      .map
      .with_index(1) { |team,position|
      TeamReport.new(team: team, position: position) }
  end

  private

  def score(team)
    team.raw_score || 0
  end
end
