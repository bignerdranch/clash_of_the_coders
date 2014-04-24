class Score < ActiveRecord::Base
  validates :team_id, presence: true, uniqueness: { scope: :user,
    message: "You can only vote for a team once." }
  validates :user_id, presence: true, uniqueness: { scope: :team,
    message: "You can only vote for a team once." }
  validates :value, presence: true

  belongs_to :team, inverse_of: :scores
  belongs_to :user, inverse_of: :scores

  scope :by_user, ->(user) {
    where(user: user)
  }

  scope :score_for, ->(user_id, team_id) {
    where(team_id: team_id, user_id: user_id).first
  }

  scope :for_current_year_by, ->(id) {
    where(user_id: id)
      .includes(team: :competition_year)
      .where(competition_years: { year: Date.current.year })
  }
end
