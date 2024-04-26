class SessionsController < ApplicationController
    def new
    end
  
   def create
  user = User.find_by(email: params[:email])
  
  if user
    if user.status == "Blocked"
      redirect_to signin_path, notice: "You have been Blocked"
    elsif user.authenticate(params[:password]) && !user.authentication 
      user.update_last_login_time
      redirect_to root_path, alert: "You are not authorized to access this page."
    elsif user.authenticate(params[:password]) && user.authentication == true
      session[:user_id] = user.id
      session[:current_user_id] = user.id 
      user.update_last_login_time
      redirect_to menu_path(current_user_id: user.id), notice: "Logged in successfully!" 
    else
      redirect_to signin_path, notice: "Invalid email or password"
    end
  else
    redirect_to signin_path, notice: "Invalid email or password"
  end
end

    
    
  
    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: "Logged out successfully!"
    end
  end
  
