class CreateChampions < ActiveRecord::Migration[5.1]
  def change
    create_table :champions do |t|
      t.string :name
      t.string :damage
      t.string :rune_path
      t.string :skill_order
      t.string :primary_class
      t.string :secondary_class

      t.timestamps
    end
  end
end
