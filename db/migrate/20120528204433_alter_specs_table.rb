class AlterSpecsTable < ActiveRecord::Migration
  def up
    add_column :specs, :file_path, :string, after: :build_id
  end

  def down
    remove_column :specs, :file_path
  end
end
