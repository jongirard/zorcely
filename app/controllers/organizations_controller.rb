class OrganizationsController < ApplicationController
  layout "authorized_application"
  before_filter :check_id_guid, only: :show
  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(secure_params)
    @organization.user = User.find(current_user.id)
    if @organization.save
      redirect_to organization_path(@organization)
  else
    render :new
  end
  end

  def show
    @user = current_user
  end

  def index
    @organizations = Organization.all
  end

  private

  def secure_params
    params.required(:organization).permit(:organization_name, :nonprofit_number, :organization_description, :organization_summary)
  end

  def check_id_guid
    if Organization.where(:guid => params[:id]).exists?
      @organization = Organization.find_by_guid(params[:id])
    else
        @organization = Organization.find_by_id(params[:id])
      end
  end

end
