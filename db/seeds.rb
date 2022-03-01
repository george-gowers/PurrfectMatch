# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "cleaning up the database"

Message.destroy_all
Chatroom.destroy_all
User.destroy_all


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

user1 = User.create(
    email: "georgegowers@gmail.com",
    password: 111111,
    name: "george",
    gender: ["male", "female"].sample,
    description: "This is my cat it has grey hair and has adorable eyes",
    breed: breeds.sample,
    location: "Amsterdam",
    owner_name: ["George", "Onur"].sample,
    owner_description: "My owner is a pretty standard guy. He is alright for a human."
  )
puts "created user1 with id: #{user1.id}"

puts "creating Chatrooms"

chatrooms = []

         # engager

3.times do
  chatroom = Chatroom.new(
    engager_id: user1.id,
    receiver_id: users.sample.id,
    status: 0
  )
  chatroom.save
  puts "created Chatroom with id: #{chatroom.id}"
  chatrooms << chatroom
end

2.times do
  chatroom = Chatroom.new(
    engager_id: user1.id,
    receiver_id: users.sample.id,
    status: 1
  )
  chatroom.save
  puts "created Chatroom with id: #{chatroom.id}"
  chatrooms << chatroom
end

         # receiver

4.times do
  chatroom = Chatroom.create(
    engager_id: users.sample.id,
    receiver_id: user1.id,
    status: 0
  )
  puts "created Chatroom with id: #{chatroom.id}"
  chatrooms << chatroom
end

1.times do
  chatroom = Chatroom.create(
    engager_id: users.sample.id,
    receiver_id: user1.id,
    status: 1
  )
  puts "created Chatroom with id: #{chatroom.id}"
  chatrooms << chatroom
end

# 100.times do
#   message = Message.new(
#     content: "this is a message"
#   )
#   message.chatroom = chatrooms.sample
#   message.user = users.sample
#   message.save
#   puts "created Message with id: #{message.id}"
# end

puts "Done seeding, have fun coding!"
