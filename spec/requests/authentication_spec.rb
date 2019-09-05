require 'rails_helper'

RSpec.describe 'POST /login', type: :request do
  context 'when params are correct' do
    it 'returns 200' do
      user = create(:user, email: 'user@example.com', password: 'password')
      params = { user: { email: 'user@example.com', password: 'password' }}

      post '/login', params: params

      expect(response).to have_http_status(200)
    end

    it 'returns JWT token in authorization header' do
      user = create(:user, email: 'user@example.com', password: 'password')
      params = { user: { email: 'user@example.com', password: 'password' }}

      post '/login', params: params

      expect(response.headers['Authorization']).to be_present
    end

    it 'returns valid JWT token' do
      user = create(:user, email: 'user@example.com', password: 'password')
      params = { user: { email: 'user@example.com', password: 'password' }}

      post '/login', params: params

      expect(response.header['Authorization']).to be_present
    end
  end

  context 'when login params are incorrect' do
    it 'returns unathorized status' do
      post '/login'

      expect(response.status).to eq 401
    end
  end
end

RSpec.describe 'DELETE /logout', type: :request do
  it 'returns 204, no content' do
    delete '/logout'

    expect(response).to have_http_status(204)
  end
end