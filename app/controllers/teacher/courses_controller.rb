class Teacher::CoursesController < ApplicationController
    before_filter :check_role
    def index
        @courses = Course.where(user_id: current_user.id)
    end
    def new 
        @course = Course.new
    end

    def create
        @course = Course.new(course_params)
        @course.user_id = current_user.id
        if @course.save
            log_in @course
            flash[:success] = "The Course has been created"
            redirect_to teacher_courses_path
        else
            render 'new'
        end
    end
    
    def edit
        @course = Course.find(params[:id])
    end

    def update
        @course = Course.find(params[:id])
        if @course.update(course_params)
            flash[:success] = "Course has ben saved"
            redirect_to edit_teacher_course_path(@course)
        else
            render 'edit'
        end 
    end

    def destroy
        @course = Course.find(params[:id])
        @course.destroy
        flash[:success] = "Course has ben deleted"
        redirect_to courses_redirect_path
    end

    private 
        def course_params
            params.require(:course).permit(:title)
        end
        
        def check_role
            if !is_teacher?
                redirect_to '/login'
            end
        end
end
