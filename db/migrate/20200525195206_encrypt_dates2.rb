class EncryptDates2 < ActiveRecord::Migration[5.2]
  def change
    add_column :question_answers, :timeStarted_ciphertext, :text
    add_column :question_answers, :timeEnded_ciphertext, :text
    add_column :question_answers, :created_at_ciphertext, :text
    add_column :question_answers, :updated_at_ciphertext, :text
  end
end
