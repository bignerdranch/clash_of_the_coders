FactoryGirl.define do
  factory :score do
    team
    user
    value { Random.rand(85) }
  end
end
