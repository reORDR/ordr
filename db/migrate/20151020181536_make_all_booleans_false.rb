class MakeAllBooleansFalse < ActiveRecord::Migration
  def change
    change_column :job_applications, :sent, :boolean, :default => false
    change_column :networks, :plans, :boolean, :default => false
    change_column :networks, :done, :boolean, :default => false
    change_column :interviews, :thank_you, :boolean, :default => false
  end
end
