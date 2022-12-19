class GistsController < ApplicationController
  before_action :set_test_passage, only: %i[new create]

  def new
    @gist = Gist.new
  end

  def create
    result = GistQuestionService.new(@test_passage.current_questions).call

    if result.success?
      current_user.gists.create(question: @test_passage.current_questions, url: result.gist_url)

      flash = {notice: t('.success', url_html: helpers.link_to(result.gist_url, result.gist_url, target: '_blank').html_safe) }

    else
      flash = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash

  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
