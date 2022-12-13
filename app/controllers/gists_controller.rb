class GistsController < ApplicationController
  before_action :set_test_passage, only: %i[new create]

  def new
    @gist = Gist.new
  end

  def create
    result = GistQuestionService.new(@test_passage.current_questions).call

    if result.success?
      Gist.create!(question: @test_passage.current_questions, user: current_user, url: result.gist_url)
      flash[:notice] = "#{I18n.t('.success')} - #{view_context.link_to(I18n.t('.link'), result.gist_url)}"
    else
      flash[:alert] = I18n.t('.failure')
    end

    redirect_to @test_passage, status: :see_other
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
