class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :users, through: :user_tests, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :questions, dependent: :destroy

  scope :easy, -> { where (level: 0..1) }
  scope :middle, -> { where (level: 2..4) }
  scope :hard, { where (level: 5..Float::INFINITY) }
  scope :tests_by_category, -> (category_title)
                               joins(:category)
                              .where(categories: { title: category_title})
                              .order(title: :desc)


  def self.tests_by_category(category_title)
    tests_by_category(category_title).pluck(:title)
  end

end



#1. Определите scope-методы:
#для выбора правильных Ответов
#Для выбора Тестов по уровню сложности:
  #простой (нулевой или первый уровень),
       #средний (со второго по четвёртый),
       #сложный (с пятого и выше). Значение положительной бесконечности можно получить с помощью константы Float::INFINITY
#scope-метод по умолчанию для получения Категорий, отсортированных по названию в порядке возрастания

#2. Используйте scope-методы вместо методов моделей, которые были определены в предыдущих заданиях

3. Определите валидации данных:
Наличие атрибутов title, body, email в соответствующих моделях
Уровень Теста может быть только положительным целым числом
Может существовать только один Тест с данным названием и уровнем
У одного Вопроса может быть от 1-го до 4-х ответов.
