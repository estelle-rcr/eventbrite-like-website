class UsersController < ApplicationController
  before_action :only_user

  def show
    @user = User.find(params[:id])
    @admin_events = Event.where(admin_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update(first_name: params[:first_name], last_name: params[:last_name], description: params[:description])
        flash[:success] = "Your account informations have been modified"
        redirect_to root_path
      else
        render :edit
      end
    end

    def destroy
      @user = User.find(params[:id])
      if @user.destroy
        flash[:success] = "Your account has been deleted"
        redirect_to root_path
      else 
        render 'show'
      end
    end

    private
    def only_user
      @user = User.find(params[:id])
      unless @user == current_user
        flash[:danger] = "Sorry, it's not your profile page, you can't access it."
        redirect_to root_path
      end
    end
end
