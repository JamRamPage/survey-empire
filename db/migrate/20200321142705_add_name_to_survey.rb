class AddNameToSurvey < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :survey_name, :string, default: "", null: false 
  end
end
