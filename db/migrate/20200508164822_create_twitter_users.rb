class CreateTwitterUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :twitter_users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :token
      t.string :secret

      t.timestamps
    end
  end
end
