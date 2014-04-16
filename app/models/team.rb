class Team < ActiveRecord::Base
  MEMBER_LIMIT = 4
  validates :competition_year_id, presence: true
  validates :name, presence: true
  validate :member_limit

  belongs_to :competition_year, inverse_of: :teams
  has_many :members, through: :team_members, source: :user
  has_many :team_members, inverse_of: :team
  has_many :scores, inverse_of: :team

  scope :for_current_year, -> {
    includes(:competition_year)
      .where(competition_years: { year: Date.current.year })
  }

  def member_limit
    if members.count > MEMBER_LIMIT
      errors.add(:members, "Teams can have no more than #{MEMBER_LIMIT} members.")
    end
  end
end
