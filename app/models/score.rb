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
end
