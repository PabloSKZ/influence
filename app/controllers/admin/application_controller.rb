# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin
    load_and_authorize_resource param_method: :my_sanitizer
    rescue_from CanCan::AccessDenied do |exception|
      render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
      ## to avoid deprecation warnings with Rails 3.2.x (and incidentally using Ruby 1.9.3 hash syntax)
      ## this render call should be:
      # render file: "#{Rails.root}/public/403", formats: [:html], status: 403, layout: false
    end
    def authenticate_admin
      
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
