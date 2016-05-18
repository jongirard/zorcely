class ProjectsController < ApplicationController
  layout "authorized_application"
  before_filter :check_params, only: [:new, :create]

  def index
    @organizations = Organization.where(user_id: current_user)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(secure_params)
    @project.user = Project.find(current_user.id)
    if @project.save
      redirect_to project_path(@project)
  else
    render :new
  end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(secure_params)
      redirect_to :organizations
  end
  def show
    @user = current_user
    @project = Project.find(params[:id])
  end

  private

  def check_params
    @organization_id = params[:organization_id]
    if @organization_id
      #nothing
    else
      redirect_to projects_path
      flash[:error] = "Projects can only be created from an organization"
  end
  end

end
