require 'rails_helper'

describe 'CityAPI' do
  it 'gets all the cities' do
    FactoryBot.create_list(:city, 10)
    
    get '/cities'
    json = JSON.parse(response.body)

    # check if the request type = 200 returned
    expect(response.status).to eq(200)
    
    # check the total number of cities
    expect(json.length).to eq(10)
  end
end