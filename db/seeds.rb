# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times{
  Party.create(name: Faker::Dune.planet, address:
Faker::Simpsons.location, time: Faker::Time.between(DateTime.now - 1, DateTime.now))
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "123456")
}

Party.all.each do |party|
  if party.host.nil?
    user = User.all.sample
    party.host = user
    party.save
  end
end
