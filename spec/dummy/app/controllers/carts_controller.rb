class CartsController < ApplicationController

  def create
    cart = Cart.create!
    remember cart

    redirect_to cart
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy!

    forget cart
  end
end