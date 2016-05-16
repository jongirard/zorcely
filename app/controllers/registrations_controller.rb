class RegistrationsController < Devise::RegistrationsController
  def new
    @plan = params[:plan]
    if @plan && ENV['PLANS'].include?(@plan) && @plan != "admin"
      super
    else
      super
    end
  end

  def create
    super
  end

  protected

  def check_param
    @plan = params[:plan]
    if @plan && ENV['PLANS'].include?(@plan)
    else
      redirect_to page_path('plans')
      flash[:error] = "There was a problem creating your account. Please try again or <a href=\"mailto:support@goplentus.com\">Contact Support</a>."
  end
end

  def after_inactive_sign_up_path_for(resource)
      new_user_session_path
    end
end
