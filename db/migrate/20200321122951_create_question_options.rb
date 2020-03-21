class CreateQuestionOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :question_options do |t|
      t.belongs_to :question, foreign_key: true, null: false
      t.string :optionString, null: false
      t.boolean :correct, comment: 'can be null, if the survey is subjective'

      t.timestamps
    end
  end
end
