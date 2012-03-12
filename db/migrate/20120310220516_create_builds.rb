class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.string :state
      t.integer :project_id

      t.timestamps
    end
  end
end
