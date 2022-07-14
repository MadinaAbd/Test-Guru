class CreateCreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.integer :tests_id

      t.timestamps
    end
  end
end
