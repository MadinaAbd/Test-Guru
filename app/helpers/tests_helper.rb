module TestsHelper

  TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end

   def test_header(test)
    if test.new_record?
      'Создать новый #{test.title} тест'
    else
      'Редактировать #{test.title} тест'
    end
  end
end
