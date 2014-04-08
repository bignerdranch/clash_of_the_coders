class Team < ActiveRecord::Base
  validates :competition_year_id, presence: true
  validates :name, presence: true

  belongs_to :competition_year, inverse_of: :teams
end
