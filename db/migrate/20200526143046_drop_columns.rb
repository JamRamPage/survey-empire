class DropColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :question_answers, :givenAnswer, :string
    remove_column :question_answers, :timeStarted, :datetime
    remove_column :question_answers, :timeEnded, :datetime
    remove_column :question_answers, :created_at, :datetime
    remove_column :question_answers, :updated_at, :datetime

    #remove_column :surveys, :public, :boolean
    remove_column :surveys, :creationDate, :datetime
    remove_column :surveys, :expiryDate, :datetime
    remove_column :surveys, :created_at, :datetime
    remove_column :surveys, :updated_at, :datetime
    remove_column :surveys, :survey_name, :string

    #remove_column :users, :email, :string
    remove_column :users, :reset_password_token, :string
    remove_column :users, :reset_password_sent_at, :datetime
    remove_column :users, :remember_created_at, :datetime
    remove_column :users, :created_at, :datetime
    remove_column :users, :updated_at, :datetime
    remove_column :users, :consent, :boolean

    remove_column :questions, :questionString, :string
    remove_column :questions, :multipleChoice, :boolean
    remove_column :questions, :multipleAnswer, :boolean
    remove_column :questions, :created_at, :datetime
    remove_column :questions, :updated_at, :datetime

    remove_column :question_options, :optionString, :string
    remove_column :question_options, :correct, :boolean
    remove_column :question_options, :created_at, :datetime
    remove_column :question_options, :updated_at, :datetime

    remove_column :question_option_selections, :created_at, :datetime
    remove_column :question_option_selections, :updated_at, :datetime
  end
end
