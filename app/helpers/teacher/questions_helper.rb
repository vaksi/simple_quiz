module Teacher::QuestionsHelper
    def questions_total(id)
        Question.where(quiz_id: id).count
    end
end
