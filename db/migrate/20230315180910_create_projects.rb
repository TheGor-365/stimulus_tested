class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :deadline
      t.boolean :completed

      t.timestamps
    end
  end
end
