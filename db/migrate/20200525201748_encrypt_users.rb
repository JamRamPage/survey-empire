class EncryptUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email_ciphertext, :text

    add_column :users, :reset_password_token_ciphertext, :text

    add_column :users, :reset_password_sent_at_ciphertext, :text

    add_column :users, :remember_created_at_ciphertext, :text

    add_column :users, :created_at_ciphertext, :text

    add_column :users, :updated_at_ciphertext, :text

    add_column :users, :consent_ciphertext, :text
  end
end
