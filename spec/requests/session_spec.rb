RSpec.describe 'Session', type: :request do
  it 'makes a request' do
    get '/'
    expect(response.body).to include 'Rails'
  end

  it 'remembers a cart' do
    expect {
      post '/carts'
    }.to change(Cart, :count).by(1)

    expect(session[:current_cart]).to eq Cart.last.id
    expect(@controller.instance_variable_get(:@current_cart)).to eq(Cart.last)
  end

  it 'forgets a cart' do
    cart = Cart.create!
    expect {
      delete "/carts/#{cart.id}"
    }.to change(Cart, :count).by(-1)

    expect(session[:current_cart]).to eq nil
    expect(@controller.instance_variable_get(:@current_cart)).to eq(nil)
  end
end