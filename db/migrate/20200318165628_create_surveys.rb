class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.USER :belongs_to
      t.boolean :public
      t.DateTime :creationDate
      t.DateTime :expiryDate
      t.Integer :likes
      t.Integer :dislikes

      t.timestamps
    end
  end
end
