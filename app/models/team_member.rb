class TeamMember < ActiveRecord::Base
  validates :team_id, presence: true
  validates :user_id, presence: true

  belongs_to :team
  belongs_to :user
end
