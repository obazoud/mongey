class UsersController < ApplicationController
  # GET /user
  def index
    @user = current_user
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def settings
    @user = current_user
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to login_path, notice: 'User was successfully created! Now, please login...'
    else
      render action: "new"
    end
  end

  def save_settings
    @user = current_user
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to user_path, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "settings" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
