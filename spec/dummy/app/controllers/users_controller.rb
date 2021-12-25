class UsersController < ApplicationController
  def index
    current_customer
  end
end