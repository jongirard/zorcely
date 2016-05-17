class AddCompanyLogoToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :company_logo_id, :string
  end
end
