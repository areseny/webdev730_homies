module Api::V1

    class CirclesController < ApplicationController
        respond_to :json

        def index
            puts "CirclesController index"
            puts current_user.inspect
            @user = current_user.id
            render json: @user
        end

        def show
            @users = Circle.find(params[:id]).users
            render json: @users
        end

        def create
            @circle = Circle.new(circle_params)
            if @circle.save!
                render status: 200
            else
                render status: 500
            end
        end

        def update
            @circle = Circle.find(params[:id])
            @circle.update(name: params[:name])
        end

        def destroy
            @circle = Circle.find params[:id]
            @circle.destroy
        end


        def circle_params
            params.require(:circle).permit(
                :name
            )
        end
    end
end

