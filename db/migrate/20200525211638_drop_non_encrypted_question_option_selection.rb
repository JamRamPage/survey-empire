class DropNonEncryptedQuestionOptionSelection < ActiveRecord::Migration[5.2]
  def change
    connection.execute("PRAGMA defer_foreign_keys = ON")
    connection.execute("PRAGMA foreign_keys = OFF")

    remove_column :question_option_selections, :created_at, :datetime
    remove_column :question_option_selections, :updated_at, :datetime
    connection.execute("PRAGMA foreign_keys = ON")
    connection.execute("PRAGMA defer_foreign_keys = OFF")
  end

end
