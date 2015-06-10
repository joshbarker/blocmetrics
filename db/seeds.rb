 require 'faker'
 

 # Create Users
 5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end
 users = User.all

 # Create Domain
 10.times do
   RegisteredApplication.create!(
     name:  Faker::Lorem.word, 
     url:  Faker::Internet.url('wwww.example.com')
   )
 end
 registered_application = RegisteredApplication.all
 
 user = User.first
 user.skip_reconfirmation!
 user.update_attributes!(
   email: 'abmjosh@gmail.com',
   password: 'helloworld'
 )



 puts "It worked, Seed finished!"
