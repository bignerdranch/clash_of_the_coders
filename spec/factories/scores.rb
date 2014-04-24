FactoryGirl.define do
  factory :score do
    team
    user
    value { Random.rand(75) }
  end
end
