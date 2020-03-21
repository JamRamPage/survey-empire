class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.boolean :public, default: false, null: false
      t.datetime :creationDate, null: false
      t.datetime :expiryDate, null: false
      t.integer :likes, default: 0, null: false
      t.integer :dislikes, default: 0, null: false

      t.timestamps
    end
  end
end
