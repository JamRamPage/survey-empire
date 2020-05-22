class RemoveCreatorFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :creator, :string
  end
end
