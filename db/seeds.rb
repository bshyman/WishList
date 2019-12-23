# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
me = User.find_or_create_by!(email: 'bshyman@gmail.com')
Permission.create!(name: 'superuser')
Permission.create!(name: 'admin')
Permission.create!(name: 'basic')
5.times do
  event = Event.create!(name: Faker::DcComics.title)
  user  = User.create!(email: Faker::Internet.email, name: Faker::Name.name)
  UserEvent.create!(user_id: user.id, event_id: event.id, permission_id: 2)
  UserEvent.create!(user_id: me.id, event_id: event.id, permission_id: 2)
  10.times do
    user = User.create!(email: Faker::Internet.email, name: 'basic user', first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
    ue   = UserEvent.create!(user_id: user.id, event_id: event.id, permission_id: 3)
    100.times do
      Gift.create!(user_event_id: ue.id, gifter_id: UserEvent.where.not(user_id: user.id).sample.id, name: Faker::Ancient.god,
                  price:         rand(1000), url: Faker::Internet.url)
    end
  end
end