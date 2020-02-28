class CitySerializer < ActiveModel::Serializer
  attributes :id, :city_name, :city_latitude, :city_longitude
end
