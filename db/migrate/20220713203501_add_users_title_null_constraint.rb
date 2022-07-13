class AddUsersTitleNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:users, :name, :password, false)
  end
end
