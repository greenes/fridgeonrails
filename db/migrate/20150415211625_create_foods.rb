class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :weight
      t.timestamps
      t.belongs_to :fridge
    end
  end
end
