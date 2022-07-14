class CreateCreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :title, null: false
      t.integer :quastion_id
      t.boolean :correct, null: false, default: false

      t.timestamps
    end
  end
end
