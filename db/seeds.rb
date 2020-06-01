# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Organization.destroy_all
GivingEvent.destroy_all
Donation.destroy_all

User.create(name: 'chine')
Organization.create(name: 'UVa', address: '123 Rotunda Drive', description: 'Wahoowa', admin_id: User.first.id)
GivingEvent.create!(name: 'Wahoos Give', target_amount: 4000, description: 'hello world', start_date: '2020-06-01', end_date: '2020-06-05', organization_id: Organization.first.id)
Donation.create!(amount: 10, donor_id: User.first.id, giving_event_id: GivingEvent.first.id)

15.times do
  user = User.create(name: Faker::Name.first_name)

  org = Organization.create(name: Faker::Educator.university, address: Faker::Address.full_address, description: Faker::Lorem.paragraph, admin_id: user.id)

  giving_date = Faker::Date.in_date_period(month: 5)
  event_amounts = [5000, 10000, 25000, 50000, 100000, 200000]

  GivingEvent.create!(name: Faker::Hipster.sentence(word_count: 3), target_amount: event_amounts.sample, description: Faker::Hipster.paragraph(sentence_count: 4), start_date: giving_date, end_date: giving_date, organization_id: org.id)
end

75.times do
  donations = [25, 50, 75, 100, 300, 500, 1000]
  Donation.create(amount: donations.sample, donor_id: User.all.sample.id, giving_event_id: GivingEvent.all.sample.id)
end

10.times do
  user = User.create(name: Faker::Name.first_name)

  org = Organization.create(name: Faker::Educator.university, address: Faker::Address.full_address, description: Faker::Lorem.paragraph, admin_id: user.id)

  giving_date = Faker::Date.in_date_period(month: 6)
  event_amounts = [5000, 10000, 25000, 50000, 100000, 200000]

  GivingEvent.create!(name: Faker::Hipster.sentence(word_count: 3), target_amount: event_amounts.sample, description: Faker::Hipster.paragraph(sentence_count: 4), start_date: giving_date, end_date: giving_date, organization_id: org.id)
end