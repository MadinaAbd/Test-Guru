class User < ApplicationRecord

  def level_test(level)
    Test.joins('JOIN user_tests ON user_tests.test_id = tests.id')
      .where(user_tests: { user_id: id })
      .where(tests: { level: level })
  end

end



# Создайте инстанс-метод в модели User, который принимает в качестве аргумента значение уровня сложности и
# возвращает список всех Тестов, которые проходит или когда-либо проходил Пользователь на этом уровне сложности.
