class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :organization_id
      t.integer :user_id
      t.string :project_name
      t.text :project_summary
      t.text :project_description
      t.string :resource_requirements
      t.string :in_kind
      t.integer :volunteer_amount
      t.decimal :project_value

      t.timestamps null: false
    end
  end
end
