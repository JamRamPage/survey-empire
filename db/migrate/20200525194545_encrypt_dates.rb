class EncryptDates < ActiveRecord::Migration[5.2]
  def change
    add_column :question_answers, :timeStarted_ciphertext, :string
    add_column :question_answers, :timeEnded_ciphertext, :string
    add_column :question_answers, :created_at_ciphertext, :string
    add_column :question_answers, :updated_at_ciphertext, :string
  end
end
