class AddConsentToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :consent, :boolean
  end
end
