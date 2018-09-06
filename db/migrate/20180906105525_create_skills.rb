class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :passive
      t.string :q
      t.string :w
      t.string :e
      t.string :r

      t.timestamps
    end
  end
end
