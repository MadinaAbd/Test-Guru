class QuestionsController < ApplicationController

  before_action :find_test, only: [:index, :new, :create]
  before_action :find_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    render plain: { tests: @test.questions }
  end

  def show
    render plain: { test: @questions }
  end

  def new; end

  def destroy
    @question.destroy

    render plain: "Вопрос удален"
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end


  def create
    @question = @test.question.create(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def resque_with_test_not_found
    render plain: "Вопрос не найден"
  end

  def question_params
    params.require(:question).permit(:body)
  end

end