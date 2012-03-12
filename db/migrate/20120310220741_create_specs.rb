class CreateSpecs < ActiveRecord::Migration
  def change
    create_table :specs do |t|
      t.string :description
      t.string :exception
      t.string :line
      t.string :spec
      t.integer :build_id

      t.timestamps
    end
  end
end
