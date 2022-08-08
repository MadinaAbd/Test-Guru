class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validate :validate_answer_options, on :create

  private

  def validate_answer_options
    errors.add(:base) if question.answers.size > 4
  end

end

