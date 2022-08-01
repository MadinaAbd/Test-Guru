class User < ApplicationRecord
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests, dependent: :destroy
  has_many :author, class_name: 'Test', foreign_key: :author_id, dependent: :destroy

  def level_test(level)
    Test.joins('JOIN user_tests ON user_tests.test_id = tests.id')
      .where(user_tests: { user_id: id })
      .where(tests: { level: level })
  end

end


