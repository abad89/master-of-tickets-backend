class SessionsController < ApplicationController
    def create
        user = User.find_by(username: params[:formData][:username])
        session[:user_id] = user.id
        render json: user
    end

    def show
        user = User.find_by(id: session[:user_id])
        # if user
        #     render json: user
        # else
        #     render json: { error: "Not authorized" }, status: :unauthorized
        # end
    end
end