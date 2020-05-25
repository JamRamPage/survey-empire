class DropNonEncryptedQuestion < ActiveRecord::Migration[5.2]
  def change
    connection.execute("PRAGMA defer_foreign_keys = ON")
    connection.execute("PRAGMA foreign_keys = OFF")
    remove_column :questions, :questionString, :string
    remove_column :questions, :multipleChoice, :boolean
    remove_column :questions, :multipleAnswer, :boolean
    remove_column :questions, :created_at, :datetime
    remove_column :questions, :updated_at, :datetime
    connection.execute("PRAGMA foreign_keys = ON")
    connection.execute("PRAGMA defer_foreign_keys = OFF")
  end
end
