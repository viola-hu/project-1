class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.text :name
      t.text :image
      t.text :description
      t.integer :category_id

      t.timestamps
    end
  end
end
