class CreateQuestionAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :question_answers do |t|
      t.belongs_to :question, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.string :givenAnswer
      t.datetime :timeStarted
      t.datetime :timeEnded

      t.timestamps
    end
  end
end
