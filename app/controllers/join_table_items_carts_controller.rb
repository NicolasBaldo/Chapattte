class JoinTableItemsCartsController < ApplicationController

  def create
    item = Item.find(params[:item])
    puts '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
    puts item
    JoinTableItemsCart.create(cart: current_user.cart, price: item.price, item: item)
  end

  def update
  end

  def destroy
  end
end
