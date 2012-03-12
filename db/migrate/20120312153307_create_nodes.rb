class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :name
      t.string :ip
      t.string :status
      t.integer :max_workers

      t.timestamps
    end
  end
end
