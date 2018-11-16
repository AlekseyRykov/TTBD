class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :project, foreign_key: true
      t.text :description
      t.date :date
      t.time :time
      t.integer :priority
      t.boolean :completed

      t.timestamps
    end
  end
end
