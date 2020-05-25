class DropEncryptedDates < ActiveRecord::Migration[5.2]
  def change
    connection.execute("PRAGMA defer_foreign_keys = ON")
    connection.execute("PRAGMA foreign_keys = OFF")
    remove_column :question_answers, :timeStarted_ciphertext, :datetime
    remove_column :question_answers, :timeEnded_ciphertext, :datetime
    remove_column :question_answers, :created_at_ciphertext, :datetime
    remove_column :question_answers, :updated_at_ciphertext, :datetime
    connection.execute("PRAGMA foreign_keys = ON")
    connection.execute("PRAGMA defer_foreign_keys = OFF")
  end
end
