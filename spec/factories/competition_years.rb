FactoryGirl.define do
  factory :competition_year do
    year { Date.current.year }
  end
end
