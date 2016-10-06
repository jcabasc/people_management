20.times do
  person = Person.new(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    email:      Faker::Internet.email,
    job:        Faker::Company.profession,
    bio:         Faker::Lorem.paragraph,
    gender:     Person::GENDER.sample,
    birthdate:  Faker::Date.birthday(21, 50)
  )
  person.save
end