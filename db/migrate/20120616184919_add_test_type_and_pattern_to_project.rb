class AddTestTypeAndPatternToProject < ActiveRecord::Migration
  def change
    add_column :projects, :test_type, :string
    add_column :projects, :pattern, :string
  end
end
