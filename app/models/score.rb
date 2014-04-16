class Score < ActiveRecord::Base
  validates :team_id, presence: true
  validates :user_id, presence: true
  validates :value, presence: true

  belongs_to :team, inverse_of: :scores
  belongs_to :user, inverse_of: :scores
end
