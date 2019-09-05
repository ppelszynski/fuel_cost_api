require 'rails_helper'

RSpec.describe 'POST /sign_up', type: :request do
  context 'when user is not authenticated' do
    it 'returns 200' do
      params = { user: { email: 'user@example.com', password: 'password' } }

      post '/sign_up', params: params

      expect(response).to have_http_status(200)
    end

    it 'returns a new user' do
      params = { user: { email: 'user@example.com', password: 'password' } }

      post '/sign_up', params: params

      parsed_response = JSON.parse(response.body)

      expect(parsed_response).to include(
        'id' => be_kind_of(Integer),
        'email' => 'user@example.com'
      )
    end
  end

  context 'when user already exists' do
    it 'returns bad request status' do
      create(:user, email: 'user@example.com', password: 'password')
      params = { user: { email: 'user@example.com', password: 'password' } }

      post '/sign_up', params: params

      expect(response.status).to eq 400
    end

    it 'returns validation errors' do
      create(:user, email: 'user@example.com', password: 'password')
      params = { user: { email: 'user@example.com', password: 'password' } }

      post '/sign_up', params: params
      
      expect(json['errors'].first['title']).to eq('Bad Request')
    end
  end
end