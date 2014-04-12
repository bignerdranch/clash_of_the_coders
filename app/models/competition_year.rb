class CompetitionYear < ActiveRecord::Base
  validates :year, presence: true

  has_many :teams, inverse_of: :competition_year

  def self.current
    where(year: Date.current.year).first
  end
end
