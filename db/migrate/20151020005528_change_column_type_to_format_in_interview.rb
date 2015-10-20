class ChangeColumnTypeToFormatInInterview < ActiveRecord::Migration
  def change
    rename_column :interviews, :type, :format
  end
end
