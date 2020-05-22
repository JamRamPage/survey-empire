class CreateQuestionOptionSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :question_option_selections do |t|
      t.belongs_to :question_answer, foreign_key: true, null: false
      t.belongs_to :question_option, foreign_key: true, null: false

      t.timestamps
    end
  end
end
