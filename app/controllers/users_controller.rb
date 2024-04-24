require  'json'
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "User created successfully"
    else
      flash[:alert] = "Error occurred: " + @user.errors.full_messages.join(", ")
      redirect_to root_path
    end
  end
  


  def delete_selected
    selected_user_ids = JSON.parse(params[:selected_user_ids])
    if selected_user_ids.present?
      selected_user_ids.each do |user_id|
        user = User.find(user_id)
        user.destroy
      end
      flash[:notice] = 'Selected users were successfully blocked.'
    else
      flash[:alert] = 'No users selected for blocking.'
    end
    redirect_to menu_path
  end
  
  

  def block_selected
    selected_user_ids = JSON.parse(params[:selected_user_ids])
    if selected_user_ids.present?
      selected_user_ids.each do |user_id|
        user = User.find(user_id)
        user.update(status: 'Blocked')
      end
      flash[:notice] = 'Selected users were successfully blocked.'
    else
      flash[:alert] = 'No users selected for blocking.'
    end
    redirect_to menu_path
  end
  
  

  


private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :position, :status)
end

  

  private

  def set_user
    @user = User.find(params[:id])
  end
  
end
