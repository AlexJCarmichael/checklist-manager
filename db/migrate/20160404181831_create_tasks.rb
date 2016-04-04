class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :body, limit: 300, null: false
      t.boolean :completed, default: false, null: false
      t.integer :position

      t.timestamps null: false
    end
  end
end
