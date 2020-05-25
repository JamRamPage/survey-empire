class EncryptQuestionOptions < ActiveRecord::Migration[5.2]
  def change
    add_column :question_options, :optionString_ciphertext, :text
    add_column :question_options, :correct_ciphertext, :text
    add_column :question_options, :created_at_ciphertext, :text
    add_column :question_options, :updated_at_ciphertext, :text
  end
end
