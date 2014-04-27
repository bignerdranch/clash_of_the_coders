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
      .map { |team| TeamReport.new(team: team) }
      .sort { |a,b| b.score <=> a.score }
      .map
      .with_index(1) { |team,position|
      RankedTeam.new(team: team, position: position) }
  end
end
