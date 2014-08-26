class ForgotusersController < ApplicationController
  # GET /forgotusers
  # GET /forgotusers.json
  def index
    @forgotusers = Forgotuser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @forgotusers }
    end
  end

  # GET /forgotusers/1
  # GET /forgotusers/1.json
  def show
    @forgotuser = Forgotuser.find(params[:id])
    Forgotuser.delete_all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @forgotuser }
      @answer1 = @forgotuser.securityAnswer

    if(@answer1 == session[:forgotAnswer])
          session[:showText] = 'true'
          @answer1 = nil
          redirect_to new_forgotuser_path(:mailid => session[:forgotId]) and return
    else
        @user = User.where(:emailId => session[:forgotId])[0]
        @user.update_attribute(:password, @forgotuser.newPassword)
        session[:showText] = 'false'
        #@forgotuser.destroy
        redirect_to login_path and return
    end
    
      end
  end

  # GET /forgotusers/new
  # GET /forgotusers/new.json
  def new
    @showText = session[:showText]
    @forgotuser = Forgotuser.new
    @user = User.where(:emailId => params[:mailid])[0]
    session[:forgotId] = @user.emailId
    @question = @user.securityQuestion
    @answer = @user.securityAnswer
    session[:forgotAnswer] = @answer
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @forgotuser }
    end
  end

  # GET /forgotusers/1/edit
  def edit
    @forgotuser = Forgotuser.find(params[:id])
  end

  # POST /forgotusers
  # POST /forgotusers.json
  def create
    @forgotuser = Forgotuser.new(params[:forgotuser])
    
    respond_to do |format|
      if @forgotuser.save
        format.html { redirect_to @forgotuser, notice: 'Forgotuser was successfully created.' }
        format.json { render json: @forgotuser, status: :created, location: @forgotuser }
      else
        format.html { render action: "new" }
        format.json { render json: @forgotuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /forgotusers/1
  # PUT /forgotusers/1.json
  def update
    @forgotuser = Forgotuser.find(params[:id])

    respond_to do |format|
      if @forgotuser.update_attributes(params[:forgotuser])
        format.html { redirect_to @forgotuser, notice: 'Forgotuser was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @forgotuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forgotusers/1
  # DELETE /forgotusers/1.json
  def destroy
    @forgotuser = Forgotuser.find(params[:id])
    @forgotuser.destroy

    respond_to do |format|
      format.html { redirect_to forgotusers_url }
      format.json { head :no_content }
    end
  end
end
