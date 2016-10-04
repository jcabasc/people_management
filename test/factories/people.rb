FactoryGirl.define do
  factory :person do
    first_name "John"
    last_name "Doe"
    sequence :email do |n|
      "john#{n}@doe.com"
    end
    gender "male"
    birthdate Date.today - 30.years
  end
end
