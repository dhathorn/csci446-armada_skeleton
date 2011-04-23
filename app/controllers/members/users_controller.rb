class Members::UsersController < ApplicationController

  def show
    require_user
    @user = current_user
  end

  def edit
    require_user
    @user = current_user
  end

  def update
    require_user
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to( members_root_path, :notice => 'profile was successfully updated.')
    else
      render :action => "edit"
    end
  end

end
