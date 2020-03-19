class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.boolean :public
      t.datetime :creationDate
      t.datetime :expiryDate
      t.integer :likes
      t.integer :dislikes

      t.timestamps
    end
  end
end
