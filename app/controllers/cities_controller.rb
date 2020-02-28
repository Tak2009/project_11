class CitiesController < ApplicationController

    def index
        cities = City.all
        render json: cities, except: [:created_at, :updated_at]

    end

    def london_users_index
        london_users = User.all.where(city_id: 1)
        # render json: london_users, except: [:created_at, :updated_at], include: [:city]
        render json: london_users.to_json(include: [:city], except: [:created_at, :updated_at])
    end

    def london_50_mi_of_london_users_index
        users = User.all.all.where(city_id: 2)
        render json: users, except: [:created_at, :updated_at], include: [:city]
    end

end
