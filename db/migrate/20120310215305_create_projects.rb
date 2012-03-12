class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :repo
      t.text :description
      t.string :ruby_version

      t.timestamps
    end
  end
end
