class AddChampionsToSkills < ActiveRecord::Migration[5.1]
  def change
    add_reference :skills, :champion, foreign_key: true
  end
end
