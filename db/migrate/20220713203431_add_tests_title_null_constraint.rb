class AddTestsTitleNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:tests, :title, :level, false)
  end
end
