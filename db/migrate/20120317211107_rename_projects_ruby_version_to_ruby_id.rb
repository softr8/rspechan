class RenameProjectsRubyVersionToRubyId < ActiveRecord::Migration
  def change
    change_column :projects, :ruby_version, :integer, default: nil
    rename_column :projects, :ruby_version, :ruby_id
  end
end
