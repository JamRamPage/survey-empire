class DropEncryptedDates2 < ActiveRecord::Migration[5.2]
  def change
    connection.execute("PRAGMA defer_foreign_keys = ON")
    connection.execute("PRAGMA foreign_keys = OFF")
    remove_column :question_answers, :timeStarted_ciphertext, :string
    remove_column :question_answers, :timeEnded_ciphertext, :string
    remove_column :question_answers, :created_at_ciphertext, :string
    remove_column :question_answers, :updated_at_ciphertext, :string
    connection.execute("PRAGMA foreign_keys = ON")
    connection.execute("PRAGMA defer_foreign_keys = OFF")
  end
end
