class ChangeJobTypeToSource < ActiveRecord::Migration
  def change
    rename_column :jobs, :type, :source
  end
end
