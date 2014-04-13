FactoryGirl.define do
  factory :user do
    active true
    bnr_team_id { Random.rand(10) }
    sequence(:email) { |n| "user#{n}@bignerdranch.com" }
    gravatar { File.join(Rails.root, 'spec/support/files/cbq.jpeg') }
    sequence(:name) { |n| "Some #{n} Nerd" }
  end
end
