class AddDeployedToSurvey < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :deployed, :boolean, default: false
  end
end
