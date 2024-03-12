require "faker"

Item.destroy_all
User.destroy_all

search_terms = ['cat']
6.times do
  new_item = Item.create(title: Faker::Creature::Cat.breed, description: Faker::ChuckNorris.fact, price: Faker::Commerce.price, image_url: Faker::LoremFlickr.image(search_terms: [search_terms.cycle.next]))
end

20.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name}.#{last_name}@yopmail.com"

  User.create(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: 'password')
end