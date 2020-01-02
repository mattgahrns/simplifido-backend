class PostsController < ApplicationController
    skip_before_action :authorized, only: [:index]
    def create
        post = Post.new(post_params)
        user = User.find_by(id: params[:id])
        post.user_id = user.id
        if post.save
            render json: post, include: [:user]
        else
            render json: { message: 'Post could not be created. Please try again.' }
        end
    end

    def index
        posts = Post.all
        render json: posts, include: [:user]
    end

    private
    def post_params
        params.require(:post).permit(:title, :activity, :description, :when)
    end
end
