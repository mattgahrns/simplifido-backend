class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def profile
        render json: { user: current_user }, status: :accepted
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: { user: @user,
            jwt: @token }, status: :created
        else
            render json: { error: 'failed to create user'}, status: :not_acceptable
        end
    end

    def dogs
        @user = User.find(params[:id])
        @dogs = Dog.where("user_id = ?", @user.id)
        render json: {dogs: @dogs}
    end

    def posts
        @user = User.find(params[:id])
        @posts = Post.where("user_id = ?", @user.id)
        render json: @posts, include: [:user]
    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :email, :city, :state, :img_url)
    end
end
