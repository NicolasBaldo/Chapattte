class Cart < ApplicationRecord

    belongs_to :user
    has_many :join_table_items_cart
    has_many :items, through: :join_table_items_cart

end
