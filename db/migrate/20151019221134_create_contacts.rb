class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :company
      t.string :phone
      t.string :linkedin_url
      t.references :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
