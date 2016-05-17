class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :guid
      t.string :organization_name
      t.integer :nonprofit_number
      t.string :cover_photo_url
      t.text :organization_summary
      t.text :organization_description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
