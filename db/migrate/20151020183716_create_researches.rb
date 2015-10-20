class CreateResearches < ActiveRecord::Migration
  def change
    create_table :researches do |t|
      t.references :job, index: true, foreign_key: true
      t.text :company_mission
      t.text :company_goals
      t.text :current_projects
      t.boolean :done
    end
  end
end
