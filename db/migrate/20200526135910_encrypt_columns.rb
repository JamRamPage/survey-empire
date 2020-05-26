class EncryptColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :question_answers, :givenAnswer_ciphertext, :text
    add_column :question_answers, :timeStarted_ciphertext, :text
    add_column :question_answers, :timeEnded_ciphertext, :text
    add_column :question_answers, :created_at_ciphertext, :text
    add_column :question_answers, :updated_at_ciphertext, :text

    add_column :surveys, :public_ciphertext, :text
    add_column :surveys, :creationDate_ciphertext, :text
    add_column :surveys, :expiryDate_ciphertext, :text
    add_column :surveys, :created_at_ciphertext, :text
    add_column :surveys, :updated_at_ciphertext, :text
    add_column :surveys, :survey_name_ciphertext, :text

    add_column :users, :email_ciphertext, :text
    add_column :users, :reset_password_token_ciphertext, :text
    add_column :users, :reset_password_sent_at_ciphertext, :text
    add_column :users, :remember_created_at_ciphertext, :text
    add_column :users, :created_at_ciphertext, :text
    add_column :users, :updated_at_ciphertext, :text
    add_column :users, :consent_ciphertext, :text

    add_column :questions, :questionString_ciphertext, :text
    add_column :questions, :multipleChoice_ciphertext, :text
    add_column :questions, :multipleAnswer_ciphertext, :text
    add_column :questions, :created_at_ciphertext, :text
    add_column :questions, :updated_at_ciphertext, :text

    add_column :question_options, :optionString_ciphertext, :text
    add_column :question_options, :correct_ciphertext, :text
    add_column :question_options, :created_at_ciphertext, :text
    add_column :question_options, :updated_at_ciphertext, :text

    add_column :question_option_selections, :created_at_ciphertext, :text
    add_column :question_option_selections, :updated_at_ciphertext, :text

    
  end
end
