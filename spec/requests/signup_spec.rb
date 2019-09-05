require 'rails_helper'

RSpec.describe 'POST /sign_up', type: :request do
  context 'when user is unauthenticated' do
    it 'returns 200' do
      params = { user: { email: 'user@example.com', password: 'password' } }

      post '/sign_up', params: params

      expect(response.status).to eq 200
    end

    it 'returns a new user' do
      params = { user: { email: 'user@example.com', password: 'password' } }

      post '/sign_up', params: params

      expect(response.body).to match_schema('user')
    end
  end

  context 'when user already exists' do
    it 'returns bad request status' do
      User.create!(email: 'user@example.com')
      params = { user: { email: 'user@example.com', password: 'password' } }

      post '/sign_up', params: params

      expect(response.status).to eq 400
    end

    it 'returns validation errors' do
      User.create!(email: 'user@example.com')
      params = { user: { email: 'user@example.com', password: 'password' } }

      post '/sign_up', params: params
      
      expect(json['errors'].first['title']).to eq('Bad Request')
    end
  end
end