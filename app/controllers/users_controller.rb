class UsersController < ApplicationController

    def index
        users = User.all
        # render json: users, except: [:created_at, :updated_at] #ori
        render json: users
    end

    def london_users_index
        london_users = User.all.where(city_id: 1)
        # render json: london_users, except: [:created_at, :updated_at], include: [:city] # original
        render json: london_users
    end

    def london_50_mi_of_london_users_index
        within_50_lonodn_users = User.all.all.where(city_id: 2)
        render json: within_50_lonodn_users
    end

end
