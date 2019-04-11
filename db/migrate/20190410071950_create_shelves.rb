class CreateShelves < ActiveRecord::Migration[5.2]
  def change
    create_table :shelves do |t|
      t.string :title
      t.string :category
      t.text :body

      t.timestamps
    end
  end
end
