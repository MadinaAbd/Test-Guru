class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :users, through: :user_tests
  has_many :questions

  def self.tests_by_cotegory(category_title)
    joins('JOIN categories ON tests.category_id = categories.id')
    .where(categories: {title: category_title})
    .order(title: :desc)
    .pluck(:title)
  end

end
