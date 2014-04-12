class CompetitionYear < ActiveRecord::Base
  validates :year, presence: true

  has_many :teams, inverse_of: :competition_year
end