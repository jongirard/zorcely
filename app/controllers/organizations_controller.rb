class OrganizationsController < ApplicationController
  layout "authorized_application"
  before_filter :check_id_guid, :only => :show
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

  private

  def secure_params
    params.required(:organization).permit(:organization_name, :nonprofit_number, :organization_description)
  end

  def check_id_guid
    #@organization = Organization.find(params[:id])
    if Organization.where(:guid => params[:guid]).exists?
      @organization = Organization.find_by_guid(params[:guid])
    else
        @organization = Organization.find(params[:guid])
      end
  end

end
