class CreateQuestionAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :question_answers do |t|
      t.belongs_to :question, foreign_key: true, null: false
      t.belongs_to :user, foreign_key: true, null: false
      t.string :givenAnswer, comment: 'can be null as answer may be a selection instead of text entry'
      t.datetime :timeStarted, comment: 'null before question started???'
      t.datetime :timeEnded, comment: 'null before answer submitted'

      t.timestamps
    end
  end
end
