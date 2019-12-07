# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
me = User.create(email: 'bshyman@gmail.com')
10.times do
  event = Event.create(name: Faker::DcComics.title)
  user  = User.create!(email: Faker::Internet.email, name: 'admin')
  UserEvent.create(user_id: user.id, event_id: event.id, permission_id: 2)
  UserEvent.create(user_id: me.id, event_id: event.id, permission_id: 2)
  5.times do
    user = User.create!(email: Faker::Internet.email, name: 'basic user')
    ue   = UserEvent.create(user_id: user.id, event_idmer: event.id, permission_id: 3)
    Gift.create(user_event_id: ue.id, giftee_event_id: UserEvent.where.not(user_id: user.id).sample.id, name: Faker::Ancient.god,
                price: 100.00, url: Faker::Internet.url)
  end
end