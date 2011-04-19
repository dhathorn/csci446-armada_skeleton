class UsersController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]

  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @user }
    end
  end

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

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        flash[:success] = 'User was successfully created.'
        format.html { redirect_to home_url_for(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

end
