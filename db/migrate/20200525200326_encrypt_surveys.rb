class EncryptSurveys < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :public_ciphertext, :text
    add_column :surveys, :creationDate_ciphertext, :text
    add_column :surveys, :expiryDate_ciphertext, :text
    add_column :surveys, :created_at_ciphertext, :text
    add_column :surveys, :updated_at_ciphertext, :text
    add_column :surveys, :survey_name_ciphertext, :text
  end
end
