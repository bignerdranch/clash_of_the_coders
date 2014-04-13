class CompetitionYear < ActiveRecord::Base
  validates :year, presence: true

  has_many :teams, inverse_of: :competition_year

  def self.current
    year = Date.current.year
    where(year: year).first || create(year: year)
  end
end
