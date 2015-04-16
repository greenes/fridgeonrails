class CreateFridges < ActiveRecord::Migration
  def change
    create_table :fridges do |t|
      t.belongs_to :user
      t.string :location
      t.string :brand
      t.integer :size
    end
  end
end
