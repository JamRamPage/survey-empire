class DropNonEncryptedQa < ActiveRecord::Migration[5.2]
  def change
    connection.execute("PRAGMA defer_foreign_keys = ON")
    connection.execute("PRAGMA foreign_keys = OFF")
    remove_column :question_answers, :givenAnswer, :string
    remove_column :question_answers, :timeStarted, :datetime
    remove_column :question_answers, :timeEnded, :datetime
    remove_column :question_answers, :created_at, :datetime
    remove_column :question_answers, :updated_at, :datetime
    connection.execute("PRAGMA foreign_keys = ON")
    connection.execute("PRAGMA defer_foreign_keys = OFF")
  end
end
