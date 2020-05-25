class EncryptQuestionOptionSelections < ActiveRecord::Migration[5.2]
  def change
    add_column :question_option_selections, :created_at_ciphertext, :text
    add_column :question_option_selections, :updated_at_ciphertext, :text
  end
end
