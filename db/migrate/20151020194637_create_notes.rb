class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :body
      t.references :notable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
