class User < ActiveRecord::Base
  validates :active, presence: true
  validates :email, presence: true
  validates :gravatar, presence: true
  validates :name, presence: true

  has_many :teams, through: :team_members
  has_many :team_members, inverse_of: :user
  has_many :scores, inverse_of: :user

  scope :active, -> {
    where(active:true)
  }

  scope :available, -> {
    active
  }
end
