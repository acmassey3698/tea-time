class CreateTeas < ActiveRecord::Migration[6.1]
  def change
    create_table :teas do |t|
      t.string :name
      t.string :description
      t.float :brew_time
      t.boolean :caffeinated

      t.timestamps
    end
  end
end
