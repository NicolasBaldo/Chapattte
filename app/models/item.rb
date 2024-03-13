class Item < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :price, numericality: { greater_than: 0, less_than: 1000 }, presence: true
    validates :image_url, presence: true

    has_many :join_table_items_cart
    has_many :carts, through: :join_table_items_cart

end

