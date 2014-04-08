class CreateTeam
  def initialize(params, year: nil)
    @params = params
    @year = year || Time.now.year
  end

  def save
    team.save
  end

  private
  attr_reader :params, :year

  def competition_year
    @competition_year ||= CompetitionYear.find_or_create_by(year: year)
  end

  def team
    @team ||= Team.new(params.merge(competition_year: competition_year))
  end
end
