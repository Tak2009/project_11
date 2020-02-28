class UserSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :email, :ip_address, :latitude, :longitude

  belongs_to :city
    class CitySerializer < ActiveModel::Serializer
      attributes :id, :city_name, :city_latitude, :city_longitude
    end
  
end
