require 'rails_helper'

RSpec.describe 'GET /pb95s', type: :request do
  it 'requires a user to be authenticated' do

    get '/pb95s'

    expect(response).to have_http_status(401)
  end

  it 'returns pb list' do
    user = create(:user)
    create(:pb95)

    get '/pb95s', headers: auth_headers(user)  

    expect(response).to have_http_status(200)
    parsed_response = JSON.parse(response.body)

    expect(parsed_response[0]['price']).to eq(5.00)
  end      
end