class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company_name
      t.string :url
      t.datetime :due_date
      t.string :type

      t.timestamps null: false
    end
  end
end
