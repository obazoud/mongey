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

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    logger.debug "User parameters recieved: #{params.inspect}"
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def save_settings
    @user = current_user
    logger.debug "User parameters recieved: #{params.inspect}"
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
