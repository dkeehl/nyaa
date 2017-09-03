class CreateStatus < ActiveRecord::Migration[5.0]
  def change
    create_table :status do |t|
      t.text :name
    end
  end
end
