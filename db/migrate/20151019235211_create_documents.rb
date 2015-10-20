class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.boolean :resume
      t.boolean :cover_letter
      t.boolean :portfolio
      t.boolean :certifications
      t.boolean :references
      t.boolean :recommendations
      t.boolean :done
      t.integer :job_id

      t.timestamps null: false
    end

    add_index :documents, :job_id
  end
end
