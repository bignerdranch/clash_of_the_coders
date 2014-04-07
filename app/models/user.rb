class User < ActiveRecord::Base
  validates :active, presence: true
  validates :email, presence: true
  validates :gravatar, presence: true
  validates :name, presence: true

  scope :active, -> {
    where(active:true)
  }
end
