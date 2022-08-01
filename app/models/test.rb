class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :users, through: :user_tests, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :questions, dependent: :destroy

  def self.tests_by_cotegory(category_title)
    joins(:category)
    .where(categories: { title: category_title })
    .order(title: :desc)
    .pluck(:title)
  end

end
