class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level_id, null: false, :default => 1
      t.references :category, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: {to_table: :tests}

      t.timestamps
    end
  end
end
