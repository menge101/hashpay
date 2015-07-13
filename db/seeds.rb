# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

kennel = HashKennel.create({ full_name: 'Pittsburgh Prophylactic Problems Hash House Harriers',
                             abbreviation: 'P3H3',
                             description: 'A running club with a children problem',
                             region: 'Pittsburgh, PA, USA',
                             founding: Time.zone.parse('2015-08-02 14:00:00')})

Event.create({ name: 'P3H3 Inaug',
               cost: 5.00,
               date: Time.zone.parse('2015-08-02 14:00:00'),
               description: 'The first run of the Pittsburgh area Family hash',
               location: 'Sanders St & Richmond Ave, Pittsburgh pa',
               hash_kennel_id: kennel.id })


