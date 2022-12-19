class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      @test_passage.cache_result
      assign_badge
      TestPassageComplitedMailer.test_complited(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def link_gist(gist)
    view_context.link_to('Gist', gist.html_url, target: '_blank')
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
