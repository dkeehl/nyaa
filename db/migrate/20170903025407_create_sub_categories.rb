class CreateSubCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_categories do |t|
      t.text :name
    end
  end
end
