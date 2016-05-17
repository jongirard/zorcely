class ProjectsController < ApplicationController
  layout "authorized_application"
  def index
    @organizations = Organization.where(user_id: current_user)
  end
end
