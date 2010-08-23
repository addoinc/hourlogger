# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  include AuthenticatedSystem
  include RoleRequirementSystem
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  def ensure_admin
    unless current_user.has_role?("admin")
      flash[:notice] = "Access denied!"
      redirect_to hours_url
    end
  end
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
