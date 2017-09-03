class CreateTorrents < ActiveRecord::Migration[5.0]
  def change
    create_table :torrents do |t|
      t.text :name
      t.text :hash
      t.integer :category_id
      t.integer :sub_category_id
      t.integer :status_id

      t.timestamps
    end
  end
end
