class CreateRoleChampions < ActiveRecord::Migration[5.1]
  def change
    create_table :role_champions do |t|
      t.references :role, foreign_key: true
      t.references :champion, foreign_key: true
    end
  end
end
