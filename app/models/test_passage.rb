class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_questions, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question

  def completed?
    current_questions.nil?
  end

  def questions_count
    questions.count
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions +=1
    end

    save!
  end

  def correct_percent
    100.0 / test.questions.count * correct_questions
  end

  def number_current_questions
    test.questions.where('id <= ?', current_question.id).count
  end

  def done?
    correct_percent >= SUCCESS_PERCENT
  end

  private

  def before_validation_set_first_question
    self.current_questions = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_questions.answers.correct
  end

  def next_question
    self.current_questions = if new_record?
      test.questions.order(:id).first if test.present?
    else
      test.questions.order(:id).where('id > ?', current_questions.id).first
    end
  end
end
