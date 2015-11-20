# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

kennel = Kennel.create({full_name: 'Pittsburgh Prolific Procreators Hash House Harriers',
                        abbreviation: 'P3H3',
                        description: 'Raising the next generation of half-minds',
                        region: 'Pittsburgh, PA, USA',
                        founding: Time.zone.parse('2015-08-02 14:00:00'),
                        allow_rego?: true,
                        facebook_url: 'https://www.facebook.com/groups/883347525061033/'
                       })

Event.create({name: 'P3H3 Inaug',
              cost: 5.00,
              date: Time.zone.parse('2015-10-02 14:00:00'),
              description: 'The first run of the Pittsburgh area Family hash',
              location: 'Sanders St & Richmond Ave, Pittsburgh pa',
              kennel_id: kennel.id,
              allow_rego?: true
             })

Event.create({name: 'P3H3 Run2',
              cost: 5.00,
              date: Time.zone.parse('2015-11-02 14:00:00'),
              description: 'The second run of the Pittsburgh area Family hash',
              location: 'Forbes Ave & Murry Ave, Pittsburgh pa',
              kennel_id: kennel.id,
              allow_rego?: true
             })

kennel = Kennel.create({full_name: 'Pittsburgh Hash House Harriers',
                            abbreviation: 'PGH-H3',
                            description: 'The original drinking club with a running problem',
                            region: 'Pittsburgh, PA, USA',
                            founding: Time.zone.parse('1978-08-02 14:00:00'),
                            allow_rego?: false
                           })

Event.create({name: 'Run #1234',
              cost: 0.00,
              date: Time.zone.parse('2015-11-02 14:00:00'),
              description: 'We gonna run',
              location: 'Grandview Ave & Bigham St, Pittsburgh pa',
              kennel_id: kennel.id,
              allow_rego?: true
             })

if ENV['RAILS_ENV'] == 'development'
  10.times do |i|
    puts "Building Kennel ##{i}"
    kennel = FactoryGirl.create(:kennel,
                                { full_name: Faker::Company.name,
                                  description: 'The original drinking club with a running problem',
                                  region: "#{Faker::Address.city}, #{Faker::Address.state_abbr}, #{Faker::Address.zip}",
                                  founding: Time.zone.parse('1978-08-02 14:00:00'),
                                  allow_rego?: false })

    sleep 1
    10.times do |j|
      puts "Building event ##{j} for kennel ##{i}"
      FactoryGirl.create(:event,
                         {name: 'Run #1234',
                          cost: 0.00,
                          date: Faker::Date.forward(365),
                          description: 'We gonna run',
                          location: "#{Faker::Address.street_address}, #{Faker::Address.city} #{Faker::Address.state_abbr}",
                          kennel_id: kennel.id,
                          allow_rego?: false,
                          latitude: Faker::Address.latitude,
                          longitude: Faker::Address.longitude
                         })
      sleep 1
    end
  end
end