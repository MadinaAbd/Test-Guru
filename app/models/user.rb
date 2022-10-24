require 'digest/sha1'

class User < ApplicationRecord

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy

  has_secure_password


  validates :email, presence: true,
                    uniqueness: { scope: :email, message: "Эта электронная почта уже зарегистрирована" },
                    format: {with: URI::MailTo::EMAIL_REGEXP, message: "Неправильный формат"}

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
