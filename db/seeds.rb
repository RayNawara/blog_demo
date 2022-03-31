# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: "ray@example.com", password: "password", password_confirmation: "password", name: "Ray")
User.create(email: "andrea@example.com", password: "password", password_confirmation: "password", name: "Andrea")
5.times do |i|
  Post.create(title: "Post ##{i+1}", body: "Body #{i+1} is this stuff!", user_id: User.first.id)
end
5.times do |i|
  Post.create(title: "Post ##{i+6}", body: "Body #{i+6} is this stuff!", user_id: User.last.id)
end