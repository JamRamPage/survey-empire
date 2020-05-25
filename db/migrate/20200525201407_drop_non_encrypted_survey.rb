class DropNonEncryptedSurvey < ActiveRecord::Migration[5.2]
  def change
    connection.execute("PRAGMA defer_foreign_keys = ON")
    connection.execute("PRAGMA foreign_keys = OFF")
    remove_column :surveys, :public, :boolean
    remove_column :surveys, :creationDate, :datetime
    remove_column :surveys, :expiryDate, :datetime
    remove_column :surveys, :created_at, :datetime
    remove_column :surveys, :updated_at, :datetime
    remove_column :surveys, :survey_name, :string
    connection.execute("PRAGMA foreign_keys = ON")
    connection.execute("PRAGMA defer_foreign_keys = OFF")
  end
end
