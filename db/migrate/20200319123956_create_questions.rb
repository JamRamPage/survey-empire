class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.belongs_to :survey, foreign_key: true, null: false
      t.string :questionString, null: false
      t.boolean :multipleChoice, default: false, null: false
      t.boolean :multipleAnswer, default: false, null: false

      t.timestamps
    end
  end
end
