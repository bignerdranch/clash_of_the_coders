class Lineup < ActiveRecord::Base
  validates :year, presence: true

  has_many :teams, inverse_of: :lineup
end
