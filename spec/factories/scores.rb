FactoryGirl.define do
  factory :score do
    team
    user
    learning_points { Random.rand(20) }
    wizardry_points { Random.rand(65) }
  end
end
