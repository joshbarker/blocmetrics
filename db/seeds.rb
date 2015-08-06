 require 'faker'
 
 # Create Users
 5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(8)
   )
   user.skip_confirmation!
   user.save!
 end
 users = User.all

 # Create Domain
 10.times do
   RegisteredApplication.create!(
     user: users.sample,
     name:  Faker::Lorem.word, 
     url:  Faker::Internet.url('wwww.example.com')
   )
 end
 registered_application = RegisteredApplication.all
 
 # Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!
 
 # Create a moderator
 moderator = User.new(
   name:     'Moderator User',
   email:    'moderator@example.com',
   password: 'helloworld',
   role:     'moderator'
 )
 moderator.skip_confirmation!
 moderator.save!
 
 # Create a member
 member = User.new(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
 )
 member.skip_confirmation!
 member.save!

# Create Events
event_names = ['Index', 'About', 'Contact']
app = RegisteredApplication.first
50.times do
  event = app.events.create(
    name: event_names.sample
  )
  event.created_at = Time.now - rand(200).hours
  event.save
end

puts "It worked, Seed finished!"
