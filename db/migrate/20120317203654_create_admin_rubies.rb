class CreateAdminRubies < ActiveRecord::Migration
  def change
    create_table :rubies do |t|
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end
