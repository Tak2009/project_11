require 'net/http'
require 'uri'
require 'json'

uri_all= URI.parse('https://bpdts-test-app.herokuapp.com/users') # all user
json_all = Net::HTTP.get(uri_all)
all_users = JSON.parse(json_all) # parse the json body into a Ruby data structure

uri_london = URI.parse('https://bpdts-test-app.herokuapp.com/city/London/users') # london user
json_london = Net::HTTP.get(uri_london) # with NET::HTTP, call the API
london_users = JSON.parse(json_london) # #parse the json body into a Ruby data structure

# Create users in London in the london_users table 
london_users.each do |london_user| LondonUser.create(
    user_id: london_user['id'],
    first_name: london_user['first_name'],
    last_name: london_user['last_name'],
    email: london_user['email'],
    ip_address: london_user['ip_address'],
    latitude: london_user['latitude'],
    longitude: london_user['longitude']
)
end

# Create cities in the city table.
c1 = CityList.create(:city_name => "London", :city_latitude => 51.509865, :city_longitude => -0.118092)
c2 = CityList.create(:city_name => "Within 50 mi of London", :city_latitude =>"", :city_longitude =>"")
c3 = CityList.create(:city_name => "Outside 50 mi of London", :city_latitude => "", :city_longitude => "")
c4 = CityList.create(:city_name => "Leeds", :city_latitude => 51.509865, :city_longitude => -0.118092)


total_n = LondonUser.count


# calculate distance
def calc_distance(lat1, lng1, lat2, lng2)
    
    origin_lat = lat1.to_f * Math::PI / 180
    origin_long = lng1.to_f * Math::PI / 180
    lat = lat2.to_f * Math::PI / 180
    long = lng2.to_f * Math::PI / 180
    
    # the radius of the earth in mi
    radius = 6378.137 * 0.62137
    # the absolute value of the diff between 2 longs
    diff_long = (origin_long - long).abs
    
    calc1 = Math.cos(lat) * Math.sin(diff_long)
    calc2 = Math.cos(origin_lat) * Math.sin(lat) - Math.sin(origin_lat) * Math.cos(lat) * Math.cos(diff_long)
    # calc numerator
    numerator = Math.sqrt(calc1 ** 2 + calc2 ** 2)
    # calc denominator
    denominator = Math.sin(origin_lat) * Math.sin(lat) + Math.cos(origin_lat) * Math.cos(lat) * Math.cos(diff_long)
    # calc degree
    degree = Math.atan2(numerator, denominator)
    # distance in mi
    degree * radius
  end

# byebug

all_users.each do |user| 
    User.create(
    user_id: user['id'],
    first_name: user['first_name'],
    last_name: user['last_name'],
    email: user['email'],
    ip_address: user['ip_address'],
    latitude: user['latitude'],
    longitude: user['longitude']
)
end


# dummy data for checking the distance calc function in frontend agisnt google map
u1001 = User.create(:user_id => 1001, :first_name => "Huddersfield", :last_name => "Station", :latitude => 53.648557, :longitude => -1.784449, :city_list_id => c3.id) # 163.48 mi, same as google map result. this should not be included in the 50 mi group
u1002 = User.create(:user_id => 1002, :first_name => "Great Portland", :last_name => "Station", :latitude => 51.524262, :longitude => -0.143772, :city_list_id => c1.id) # 1.48 mi, same as google map result. this should be included in the 50 mi group
# u1003 = User.create(:user_id => 1003, :first_name => "East Ilsley", :last_name => "", :latitude => 51.533576, :longitude => -1.289984) # 50.41 mi same as google map result. this should not be included in the 50 mi group.

