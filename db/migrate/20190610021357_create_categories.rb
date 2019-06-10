class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.text :name
      t.text :image
      t.text :description

      t.timestamps
    end
  end
end
