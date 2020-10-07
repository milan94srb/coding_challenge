class CoursesController < ApplicationController
    def index
        @courses = Course.all
        render json: @courses.to_json
    end

    def show
        @course = Course.find(params[:id])
        render json: @course.to_json
    end

    def new
        @new_course = Course.new
        categories = Category.all
        @category_ids = categories.map { |category|
            category.id
        }
    end

    def create
        new_course = Course.new(course_params)
        if new_course.save
            redirect_to "/courses"
        else
            error_message = {
                error: "something went wrong"
            }
            render json: error_message.to_json
        end
    end

    def edit
        @course = Course.find(params[:id])
        categories = Category.all
        @category_ids = categories.map { |category|
            category.id
        }
    end

    def update
        course = Course.find(params[:id])
        if course.update(course_params)
            redirect_to course
        else
            error_message = {
                error: "something went wrong"
            }
            render json: error_message.to_json
        end
    end

    def delete
        @course = Course.find(params[:id])
    end

    def destroy
        course = Course.find(params[:id])

        if course.destroy
            redirect_to "/courses"
        else
            error_message = {
                error: "something went wrong"
            }
            render json: error_message.to_json
        end
    end

    private

    def course_params
        params.require(:course).permit(:name, :author, :state, :category_id)
    end
end
