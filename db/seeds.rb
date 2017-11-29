# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do
  User.create!(
    username: Faker::Overwatch.hero,
    email: Faker::Internet.email,
    avatar: Faker::Avatar.image
  )
end

4.times do
  Question.create!(
    title: Faker::Lorem.characters(22),
    description: Faker::Hipster.paragraph(3..6),
    user_id: Random.rand(1..5)
  )
end

7.times do
  Answer.create!(
    description: Faker::Hipster.paragraph(3..6),
    question_id: Random.rand(1..4),
    user_id: Random.rand(1..5)
  )
end
