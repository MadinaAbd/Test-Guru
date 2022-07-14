class CreateCreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :categories_id
      t.integer :level_id, :default => 1

      t.timestamps
    end
  end
end
