class CheckoutController < ApplicationController
  # POST /checkout/create
  # A product id will be in the params in hash: params[:product_id]
  def create
    # Load up the product the user wishes to purchase from the Product model
    product = Product.find(params[:product_id])
    if product.nil?
      redirect_to root_path
      return
    end
    # Establish a connection with Stripe and then redirect the user to the payment screen
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url:          checkout_success_url,
      cancel_url:           checkout_cancel_url,
      line_items:           [
        {
          name:     product.name,
          amount:   (product.price * 100).to_i,
          currency: "cad",
          quantity: 1
        },
        {
          name:        "GST",
          description: "Goods and Services Tax",
          amount:      (product.price * 100 * 0.05).to_i,
          currency:    "cad",
          quantity:    1
        },
        {
          name:        "PST",
          description: "Provincial Sales Tax",
          amount:      (product.price * 100 * 0.07).to_i,
          currency:    "cad",
          quantity:    1
        }
      ]
    )
    respond_to do |format|
      # format.html
      format.js # render app/views/checkout/create.js.erb
    end
  end

  def success
    # We took the customers money!
  end

  def cancel
    # Something went wrong with the payment
  end
end
