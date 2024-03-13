class Item < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :price, numericality: { greater_than: 0, less_than: 1000 }, presence: true
    validates :image_url, presence: true

    has_many :carts
    has_many :orders

end

