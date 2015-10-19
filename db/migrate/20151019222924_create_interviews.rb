class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.string :type
      t.boolean :thank_you
      t.datetime :date
      t.references :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
