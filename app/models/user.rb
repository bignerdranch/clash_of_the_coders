class User < ActiveRecord::Base
  validates :email, presence: true
  validates :name, presence: true
  validates :uid, presence: true
end
