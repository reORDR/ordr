class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
      t.boolean :sent
      t.date :date
      t.references :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
