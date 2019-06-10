class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.text :name
      t.text :image
      t.text :ingredients
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
