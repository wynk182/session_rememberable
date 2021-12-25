class CartsController < ApplicationController

  def create
    cart = Cart.create!
    remember cart

    redirect_to cart
  end
end