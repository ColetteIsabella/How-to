class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :directions
      t.references :topics

      t.timestamps
    end
    add_index :projects, :topics_id
  end
end
