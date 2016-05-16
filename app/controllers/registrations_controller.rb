class RegistrationsController < Devise::RegistrationsController
  def new
    @plan = params[:plan]
    if @plan && ENV['PLANS'].include?(@plan) && @plan != "admin"
      super
    else
      redirect_to page_path('plans')
    end
  end
end
