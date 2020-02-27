class CitiesController < ApplicationController

    def index
        @cities = City.all
        render json: @cities, except: [:created_at, :updated_at]
    end

end
