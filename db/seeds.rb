# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
num_users = 24
num_articles = 12

num_users.times do
  @user = User.create(username: Faker::Internet.unique.user_name,
                      email: Faker::Internet.unique.email,
                      password: 'password')
  rand(1..num_articles).times do
    Article.create(user_id: @user.id,
                   title: Faker::Lorem.sentence,
                   description: Faker::Lorem.paragraphs(rand(2..6)),
                   created_at: Faker::Time.backward(356))
  end
end
