class MakeDefaultConsentFalse < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :consent, :boolean, default: false
  end
end
