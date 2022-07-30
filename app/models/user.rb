class User < ApplicationRecord
  has_many :tests, through: :user_tests
  has_many :author, class_name: 'Test'

  def level_test(level)
    Test.joins('JOIN user_tests ON user_tests.test_id = tests.id')
      .where(user_tests: { user_id: id })
      .where(tests: { level: level })
  end

end


