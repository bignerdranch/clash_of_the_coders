class Team < ActiveRecord::Base
  validates :lineup_id, presence: true
  validates :name, presence: true

  belongs_to :lineup, inverse_of: :teams
end
