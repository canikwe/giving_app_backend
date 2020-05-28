# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'chine', affiliation: 'alumni', graduation_year: '1999')
Organization.create(name: 'UVa', address: '123 Rotunda Drive', description: 'Wahoowa', admin_id: User.first.id)
GivingEvent.create!(name: 'Wahoos Give', target_amount: 4000, description: 'hello world', start_date: '2020-5-21', end_date: '2020-5-21', organization_id: Organization.first.id)
Donation.create!(amount: 10, donor_id: User.first.id, giving_event_id: GivingEvent.first.id)