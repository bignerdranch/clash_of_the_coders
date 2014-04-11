class Team < ActiveRecord::Base
  validates :competition_year_id, presence: true
  validates :name, presence: true

  belongs_to :competition_year, inverse_of: :teams
  has_many :members, through: :team_members, source: :user
  has_many :team_members, inverse_of: :team

  scope :for_current_year, -> {
    includes(:competition_year)
      .where(competition_years: { year: Date.current.year })
  }
end
