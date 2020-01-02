class DogsController < ApplicationController

    def create
        dog = Dog.new(dog_params)
        user = User.find_by(id: params[:id])
        dog.user_id = user.id
        if dog.save
            render json: dog, include: [:user]
        else
            render json: { message: 'Dog could not be created. Please try again.' }
        end
    end

    private
    def dog_params
        params.require(:dog).permit(:name, :breed, :img_url, :age)
    end

end
