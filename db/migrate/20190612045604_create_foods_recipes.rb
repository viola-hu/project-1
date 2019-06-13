class CreateFoodsRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :foods_recipes do |t|
      t.integer :food_id
      t.integer :recipe_id
    end
  end
end
