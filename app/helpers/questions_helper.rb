module QuestionsHelper
   def question_header(question)
    if question.new_record?
      'Создать новый #{question.test.title} вопрос'
    else
      "Редатировать #{question.test.title} вопрос"
    end
  end
end
