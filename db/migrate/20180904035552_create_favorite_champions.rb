class CreateFavoriteChampions < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_champions do |t|
      t.references :user, foreign_key: true
      t.references :champion, foreign_key: true
    end
  end
end
