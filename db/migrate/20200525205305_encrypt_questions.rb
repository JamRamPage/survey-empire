class EncryptQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :questionString_ciphertext, :text
    add_column :questions, :multipleChoice_ciphertext, :text
    add_column :questions, :multipleAnswer_ciphertext, :text
    add_column :questions, :created_at_ciphertext, :text
    add_column :questions, :updated_at_ciphertext, :text

  end
end
