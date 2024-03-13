class CartsController < ApplicationController
  def index
    @cart = Cart.all
  end

  def show
 @all_cart_items = JoinTableItemsCart.where(cart: current_user.cart)

  @cart = current_user.cart
  end

  def create
  end

  def update
  end

  def destroy
  end
end
