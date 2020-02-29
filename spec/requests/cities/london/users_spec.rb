require 'rails_helper'

describe 'UserAPI' do
  it 'gets all the users' do
    FactoryBot.create_list(:city, 1)
    FactoryBot.create_list(:user, 10, city_id: 1)
    
    get '/users'
    json = JSON.parse(response.body)

    # check if the request type = 200 returned
    expect(response.status).to eq(200)

    # check the number of users returned
    expect(json.length).to eq(10)
  end
end