class Answer < ApplicationRecord
  belongs_to :question

  validate :validate_answer_options, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_answer_options
    errors.add(:base) if question.answers.count >= 4
  end

end

