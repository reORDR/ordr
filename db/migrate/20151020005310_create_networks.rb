class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.boolean :plans
      t.date :date
      t.boolean :done
      t.references :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
