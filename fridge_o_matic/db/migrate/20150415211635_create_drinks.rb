class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.integer :totaloz
      t.timestamps
      t.belongs_to :fridge
    end
  end
end
