class RegistrationsController < Devise::RegistrationsController
  def new
    @plan = params[:plan]
    if @plan && ENV['PLANS'].include?(@plan) && @plan != "admin"
      super
    else
      super
    end
  end
end
