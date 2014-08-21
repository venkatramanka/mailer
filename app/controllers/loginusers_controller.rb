class LoginusersController < ApplicationController
  # GET /loginusers
  # GET /loginusers.json
  def index
    @loginusers = Loginuser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @loginusers }
    end
  end

  # GET /loginusers/1
  # GET /loginusers/1.json
  def show
    @loginuser = Loginuser.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @loginuser }
      @mailid = @loginuser.emailId
    @user = User.where(emailId: @mailid)[0]
    if(@user!=nil && @user.password == @loginuser.password)
      session[:mailid] = @mailid
      session[:type]="Inbox"
      @loginuser.destroy
      redirect_to(mails_path) and return
    else
      @loginuser.destroy
      redirect_to(new_loginuser_path, :notice => "Invalid Login Credentials") and return
    end
    end
  end

  # GET /loginusers/new
  # GET /loginusers/new.json
  def new
    if(params["session"] == 'nil')
      session[:mailid] = nil
    end
    @loginuser = Loginuser.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @loginuser }
    end
    
  end

  # GET /loginusers/1/edit
  def edit
    @loginuser = Loginuser.find(params[:id])
  end

  # POST /loginusers
  # POST /loginusers.json
  def create
    @loginuser = Loginuser.new(params[:loginuser])

    respond_to do |format|
      if @loginuser.save
        format.html { redirect_to @loginuser, notice: 'Loginuser was successfully created.' }
        format.json { render json: @loginuser, status: :created, location: @loginuser }
      else
        format.html { render action: "new" }
        format.json { render json: @loginuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /loginusers/1
  # PUT /loginusers/1.json
  def update
    @loginuser = Loginuser.find(params[:id])

    respond_to do |format|
      if @loginuser.update_attributes(params[:loginuser])
        format.html { redirect_to @loginuser, notice: 'Loginuser was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @loginuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loginusers/1
  # DELETE /loginusers/1.json
  def destroy
    @loginuser = Loginuser.find(params[:id])
    @loginuser.destroy

    respond_to do |format|
      format.html { redirect_to loginusers_url }
      format.json { head :no_content }
    end
  end
end
