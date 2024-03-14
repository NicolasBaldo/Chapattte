class CheckoutController < ApplicationController
  def create
    @total = params[:total].to_d
    # @event_id = params[:event_id]
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          price_data: {
            currency: 'eur',
            unit_amount: (@total*100).to_i,
            product_data: {
              name: 'Rails Stripe Checkout',
            },
          },
          quantity: 1
        },
        # metadata: {
        #   event_id: @event_id
        # },
      ],
      mode: 'payment',
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )
    redirect_to @session.url, allow_other_host: true
  end

  def success
    @total= CartItem.where(cart: current_user.cart).sum(&:price).to_f
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)

    order = Order.new(user: current_user)
    
    if order.save
      all_cart_items = CartItem.where(cart: current_user.cart)
      all_cart_items.each do |cart_item|
        OrderItem.create(item: cart_item.item, order: order)
        cart_item.destroy
      end
    end
  end
  
  def cancel
  end
    
end
