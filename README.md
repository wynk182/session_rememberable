# SessionRememberable

Quick gem for remembering and forgetting data in a session.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'session_rememberable'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install session_rememberable

## Usage

Incluce SessionRememberable concern in your application controller and define some keys to remember.

```ruby
class ApplicationController < ActionController::Base
  include SessionRememberable
    
  remember :cart
  remember :customer, class_name: 'User'
  remember :visits, static_data: true
end
```

In your controllers

```ruby
class CustomersController < ApplicationController

  def create
    customer = User.new(permitted_params)
    
    if customer.save
      remember_customer customer
      redirect_to customer
    else
      render :new
    end
  end
  
  def destroy
    customer = User.find(params[:id])
    
    if customer.destroy
      forget_customer
      redirect_to root_path
    else
      render :edit
    end
  end

  private

    def permitted_params
      params.require(:customer).permit(:name, :email)
    end
end
```

In your views (.html.haml)

```ruby
%h1
  Welcome
  = current_customer.name
```
