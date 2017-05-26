class Teacher::QuizzesController < ApplicationController
    def index
        @quizzes = Quiz.joins(:course).where(:courses => { :user_id => current_user.id} )
    end

    def questions_by_quiz_id
        @quiz = Quiz.find(params[:id])
        @questions = Question.where(:quiz_id => params[:id])
    end

    def new 
        @quiz = Quiz.new
    end

    def create
        @quiz = Quiz.new(quiz_params)
        if @quiz.save
            log_in @quiz
            flash[:success] = "The Quiz has been created"
            redirect_to teacher_quizzes_path
        else
            render 'new'
        end
    end
    
    def edit
        @quiz = Quiz.find(params[:id])
    end

    def update
        @quiz = Quiz.find(params[:id])
        if @quiz.update(quiz_params)
            flash[:success] = "Quiz has ben saved"
            redirect_to edit_teacher_quiz_path(@quiz)
        else
            render 'edit'
        end 
    end

    def destroy
        @quiz = Quiz.find(params[:id])
        @quiz.destroy
        flash[:success] = "Quiz has ben deleted"
        redirect_to quizzes_redirect_path
    end

    private 
        def quiz_params
            params.require(:quiz).permit(:title, :course_id)
        end
        
        def check_role
            if !is_teacher?
                redirect_to '/login'
            end
        end
end
