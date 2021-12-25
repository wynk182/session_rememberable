class ApplicationController < ActionController::Base
  include SessionRememberable

  remember :cart
  remember :customer, class_name: 'User'
end
