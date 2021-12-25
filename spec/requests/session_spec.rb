RSpec.describe 'Session', type: :request do
  it 'makes a request' do
    get '/'
    expect(response.body).to include 'Rails'
    expect(UsersController.instance_variable_get("@current_customer")).to eq nil
  end

  it 'remembers a cart' do
    expect {
      post '/carts'
    }.to change(Cart, :count).by(1)

    expect(session[:current_cart]).to eq Cart.last.id

    expect(CartsController.instance_variable_get("@current_cart")).to eq Cart.last
  end
end