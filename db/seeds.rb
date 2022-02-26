# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "cleaning up the database"

Chatroom.destroy_all
User.destroy_all
Message.destroy_all

puts "creating users"

users = []
breeds = ["Sphynx", "Scottish Fold", "American Shorthair", "Maine Coon"]

10.times do
  user = User.create(
    email: Faker::Internet.email,
    password: Faker::PhoneNumber.subscriber_number(length: 6),
    name: "kittycat",
    gender: ["male", "female"].sample,
    description: "This is my cat it has grey hair and has adorable eyes",
    breed: breeds.sample,
    location: "Amsterdam",
    owner_name: ["George", "Onur"].sample,
    owner_description: "My owner is a pretty standard guy. He is alright for a human."
  )
  users << user
  puts "created user with id: #{user.id}"
end

puts "creating Chatrooms"

chatrooms = []

50.times do
  chatroom = Chatroom.new(
    engager_id: users.sample.id,
    receiver_id: users.sample.id,
    status: [0, 1, 2].sample
  )
  chatroom.save
  puts "created Chatroom with id: #{chatroom.id}"
  chatrooms << chatroom
end

100.times do
  message = Message.new(
    content: "this is a message"
  )
  message.chatroom = chatrooms.sample
  message.user = users.sample
  message.save
  puts "created Message with id: #{message.id}"
end

puts "Done seeding, have fun coding!"
