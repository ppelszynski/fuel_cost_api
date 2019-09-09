require 'rails_helper'

RSpec.describe 'GET /diesels', type: :request do
  it 'requires a user to be authenticated' do

    get '/diesels'

    expect(response).to have_http_status(401)
  end

  it 'returns diesel list' do
    user = create(:user)
    create(:diesel)

    get '/diesels', headers: auth_headers(user)  

    expect(response).to have_http_status(200)
    parsed_response = JSON.parse(response.body)

    expect(parsed_response[0]['price']).to eq(6.00)
  end      
end