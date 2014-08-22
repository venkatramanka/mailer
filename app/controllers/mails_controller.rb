class MailsController < ApplicationController
  # GET /mails
  # GET /mails.json
  layout 'loggedin'
  def index
    @type = params["type"] || session[:type]
    if(@type == 'Inbox')
      @mails = Mail.where(:to => session[:mailid])
      #session[:type]=nil
    elsif(@type == 'Sent Mail')
      @mails = Mail.where(:from => session[:mailid])
      @mails2 = Mail.all.select{|j| j[:to] =~ /.*!/i}
      @mails -= @mails2
      #session[:type]=nil
    elsif(@type == 'Drafts')
      @mails = Mail.all.select{|j| j[:to] =~ /.*!/i}
    end
    #session[:mailid] = nil
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mails }
    end
  end

  # GET /mails/1
  # GET /mails/1.json
  def show
    @mail = Mail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mail }
    end
  end

  # GET /mails/new
  # GET /mails/new.json
  def new
    @mail = Mail.new
    @mail.to = params[:to]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mail }
    end
  end

  # GET /mails/1/edit
  def edit
    @mail = Mail.find(params[:id])
  end

  # POST /mails
  # POST /mails.json
  def create
    @mail = Mail.new(params[:mail])
    @mail.update_attribute(:from, session[:mailid])
    
    respond_to do |format|
     
      if @mail.save
        format.html { redirect_to @mail, notice: 'Mail successfully sent.' }
        format.json { render json: @mail, status: :created, location: @mail }
      else
        format.html { render action: "new" }
        format.json { render json: @mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mails/1
  # PUT /mails/1.json
  def update
    @mail = Mail.find(params[:id])
    @to = @mail.to[0..-2]
    respond_to do |format|
      @mail.update_attribute(:to, @to)
      if @mail.update_attributes(params[:mail])
        format.html { redirect_to @mail, notice: 'Mail was successfully sent.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mails/1
  # DELETE /mails/1.json
  def destroy
    @mail = Mail.find(params[:id])
    @mail.destroy

    respond_to do |format|
      format.html { redirect_to mails_url }
      format.json { head :no_content }
    end
  end
end
