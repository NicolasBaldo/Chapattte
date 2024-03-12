require "faker"

Item.destroy_all

search_terms = ['cat']
20.times do
  new_item = Item.create(title: Faker::Creature::Cat.breed, description: Faker::ChuckNorris.fact, price: Faker::Commerce.price, image_url: Faker::LoremFlickr.image)
end