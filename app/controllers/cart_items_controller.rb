class CartItemsController < ApplicationController
    def create
        item = Item.find(params[:item])
        puts '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
        puts item
        CartItem.create(cart: current_user.cart, price: item.price, item: item)
      end
    
      def update
      end
    
      def destroy
        cart_item = CartItem.find(params[:id])
        cart_item.destroy

        redirect_to cart_item_path
      end
end


