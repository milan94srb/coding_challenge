class VerticalsController < ApplicationController
    def index
        @verticals = Vertical.all
        render json: @verticals.to_json
    end

    def show
        @vertical = Vertical.find(params[:id])
        render json: @vertical.to_json
    end

    def new
        @new_vertical = Vertical.new
    end

    def create
        new_vertical = Vertical.new(vertical_params)

        if Category.exists?(:name => new_vertical.name)
            error_message = {
                error: "name already exists in categories"
            }
            render json: error_message.to_json
        else
            if new_vertical.save
                redirect_to "/verticals"
            else
                error_message = {
                    error: "something went wrong"
                }
                render json: error_message.to_json
            end
        end
    end

    def edit
        @vertical = Vertical.find(params[:id])
    end

    def update
        vertical = Vertical.find(params[:id])
        if vertical.update(vertical_params)
            redirect_to vertical
        else
            error_message = {
                error: "something went wrong"
            }
            render json: error_message.to_json
        end
    end

    def delete
        @vertical = Vertical.find(params[:id])
    end

    def destroy
        vertical = Vertical.find(params[:id])
        categories = Category.where("vertical_id = #{vertical.id}").all
        courses = Array.new
        categories.each do |category|
            found_courses = Course.where("category_id = #{category.id}").all
            found_courses.each do |course|
                courses.push(course)
            end
        end

        courses.each do |course|
            course.destroy
        end

        categories.each do |category|
            category.destroy
        end

        if vertical.destroy
            redirect_to "/verticals"
        else
            error_message = {
                error: "something went wrong"
            }
            render json: error_message.to_json
        end
    end

    private

    def vertical_params
        params.require(:vertical).permit(:name)
    end
end
