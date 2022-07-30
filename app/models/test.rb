class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  has_many :users, trought: :user_tests
  belongs_to :author, class_name: 'User'

  def self.tests_by_cotegory(category_title)
    joins('JOIN categories ON tests.category_id = categories.id')
    .where(categories: {title: category_title})
    .order(title: :desc)
    .pluck(:title)
  end

end
