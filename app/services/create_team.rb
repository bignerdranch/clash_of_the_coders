class CreateTeam
  def initialize(name: nil, year: nil)
    @name = name
    @year = year || Time.now.year
  end

  def save
    team.save
  end

  private
  attr_reader :name, :year

  def competition_year
    @competition_year ||= CompetitionYear.find_or_create_by(year: year)
  end

  def team
    @team ||= Team.new(Hash[name: name].merge(competition_year: competition_year))
  end
end
