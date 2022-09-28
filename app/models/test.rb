class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :users, through: :user_tests
  has_many :user_tests, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, uniqueness: { only_integer: true, greater_than: 0}

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :tests_by_category, -> (category_title) { joins(:category)
    .where(categories: { title: category_title})
    .order(title: :desc) }


  def self.tests_by_category(category_title)
    tests_by_category(category_title).pluck(:title)
  end

end
