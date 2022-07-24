class Test < ApplicationRecord

  def self.tests_by_cotegory(category_title)
    joins(:category_id)
    .where(categories: {title: category_title})
    .order(title: desc)
    .pluck(:title)
  end

end
