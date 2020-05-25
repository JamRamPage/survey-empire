class DropNonEncryptedUser < ActiveRecord::Migration[5.2]
  def change
    connection.execute("PRAGMA defer_foreign_keys = ON")
    connection.execute("PRAGMA foreign_keys = OFF")
    remove_column :users, :email, :string

    remove_column :users, :reset_password_token, :string

    remove_column :users, :reset_password_sent_at, :datetime

    remove_column :users, :remember_created_at, :datetime

    remove_column :users, :created_at, :datetime

    remove_column :users, :updated_at, :datetime

    remove_column :users, :consent, :boolean
    connection.execute("PRAGMA foreign_keys = ON")
    connection.execute("PRAGMA defer_foreign_keys = OFF")
  end
end
