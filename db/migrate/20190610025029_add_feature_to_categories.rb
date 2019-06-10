class AddFeatureToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :feature, :text
  end
end
