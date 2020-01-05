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

    def update
        post = Post.find_by(id: params[:id])
        if post.update(post_params)
            render json: { message: 'Post updated!' }
        else
            render json: { message: 'Post could not be edited. Please try again.' }
        end
    end

    def destroy
        post = Post.find_by(id: params[:id])
        post.destroy
    end

    private
    def post_params
        params.require(:post).permit(:title, :activity, :description, :when)
    end
end
