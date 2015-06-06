require 'faker'

app = RegisteredApplication.create(name: Faker::App.name, url: "www.example.com")

10.times do 
  some_payload = {referer: Faker::Internet.domain_name, ip_address: Faker::Internet.ip_v6_address}
  Event.create(name: Faker::Hacker.noun, registered_application: app, payload: some_payload  )
end


 puts "Seed finished"
