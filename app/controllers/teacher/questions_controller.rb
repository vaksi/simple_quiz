class Teacher::QuestionsController < ApplicationController
    def create
        @question = Question.new(question_params)
        if @question.save
            log_in @question
            flash[:success] = "The Question has been created"
            redirect_to "/teacher/quizzes/#{@question.quiz_id}/questions"
        else
            render 'new'
        end
    end

    def edit
        @question = Question.find(params[:id])
    end

    def update
        @question = Question.find(params[:id])
        if @question.update(question_params)
            flash[:success] = "Question has ben saved"
            redirect_to edit_teacher_quiz_path(@question)
        else
            render 'edit'
        end
    end

    def destroy
        @question = Question.find(params[:id])
        @question.destroy
        flash[:success] = "Question has ben deleted"
        redirect_to "/teacher/quizzes/#{@question.quiz_id}/questions"
    end

    private 
        def question_params
            params.require(:question).permit(:description, :answer_digest, :quiz_id)
        end
        
        def check_role
            if !is_teacher?
                redirect_to '/login'
            end
        end

end
