class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.belongs_to :survey, foreign_key: true
      t.string :questionString
      t.boolean :multipleChoice
      t.boolean :multipleAnswer

      t.timestamps
    end
  end
end
