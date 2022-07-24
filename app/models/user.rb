class User < ApplicationRecord

  def level_test(level)
    tests.where (level: level)
  end

end
