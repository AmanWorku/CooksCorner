class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.integer :preparation_time
      t.integer :cooking_time

      t.timestamps
    end
  end
end
