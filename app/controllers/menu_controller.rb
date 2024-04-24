class MenuController < ApplicationController
    include SessionsHelper
    before_action :require_login
  
    def index
        @users = User.all 
    end
  
    private
  
    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to signin_path
      end
    end
  end
  