class EncryptQuestionAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :question_answers, :givenAnswer_ciphertext, :string
    add_column :question_answers, :timeStarted_ciphertext, :datetime
    add_column :question_answers, :timeEnded_ciphertext, :datetime
    add_column :question_answers, :created_at_ciphertext, :datetime
    add_column :question_answers, :updated_at_ciphertext, :datetime
  end
end
