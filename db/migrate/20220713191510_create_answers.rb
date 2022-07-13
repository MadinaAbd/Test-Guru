class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :title
      t.integer :questions_id

      t.timestamps
    end
  end
end
