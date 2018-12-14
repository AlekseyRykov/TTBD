class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.references :parent_project, index: true
      t.timestamps
    end
  end
end
