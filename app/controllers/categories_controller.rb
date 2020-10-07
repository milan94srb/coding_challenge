class CategoriesController < ApplicationController
    def index
        @categories = Category.all
        render json: @categories.to_json
    end

    def show
        @category = Category.find(params[:id])
        render json: @category.to_json
    end

    def new
        @new_category = Category.new
        verticals = Vertical.all
        @vertical_ids = verticals.map { |vertical|
            vertical.id
        }
    end

    def create
        new_category = Category.new(category_params)

        if Vertical.exists?(:name => new_category.name)
            error_message = {
                error: "name already exists in verticals"
            }
            render json: error_message.to_json
        else
            if new_category.save
                redirect_to "/categories"
            else
                error_message = {
                    error: "something went wrong"
                }
                render json: error_message.to_json
            end
        end
    end

    def edit
        @category = Category.find(params[:id])
        verticals = Vertical.all
        @vertical_ids = verticals.map { |vertical|
            vertical.id
        }
    end

    def update
        category = Category.find(params[:id])
        if category.update(category_params)
            redirect_to category
        else
            error_message = {
                error: "something went wrong"
            }
            render json: error_message.to_json
        end
    end

    def delete
        @category = Category.find(params[:id])
    end

    def destroy
        category = Category.find(params[:id])
        courses = Course.where("category_id = #{category.id}").all

        courses.each do |course|
            course.destroy
        end

        if category.destroy
            redirect_to "/categories"
        else
            error_message = {
                error: "something went wrong"
            }
            render json: error_message.to_json
        end
    end

    private

    def category_params
        params.require(:category).permit(:name, :state, :vertical_id)
    end
end
