class CitiesController < ApplicationController

    def index
        @cities = City.all
        render json: @cities, except: [:created_at, :updated_at]
    end

    def london_users_index
        @london_users = LondonUser.all
        render json: @london_users, except: [:created_at, :updated_at]
    end

    def london_50_mi_of_london_users_index
        @users = User.all
        render json: @users, except: [:created_at, :updated_at]
    end

end
