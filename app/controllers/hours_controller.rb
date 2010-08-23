class HoursController < ApplicationController
  
  before_filter :login_required
  
  # GET /hours
  # GET /hours.xml
  def index
    @filter_args = Hour.new
    is_admin = current_user.has_role?("admin")
    conditions = {}
    
    if( params[:hour] )
      @filter_args.attributes = params[:hour]
      conditions.merge!( :log_date => @filter_args.log_date )
      if( is_admin )
        conditions.merge!( :user_id => @filter_args.user_id )
      end
    end

    unless is_admin
      conditions.merge!( :user_id => current_user.id )
    end
    
    @hours = Hour.find(
      :all,
      :conditions => conditions
    )
    @hour = Hour.new
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hours }
    end
  end
  
  # GET /hours/1
  # GET /hours/1.xml
  def show
    @hour = Hour.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hour }
    end
  end
  
  # GET /hours/new
  # GET /hours/new.xml
  def new
    @hour = Hour.new
    
    respond_to do |format|
      format.html { render :partial => "new", :layout => true }
      format.xml  { render :xml => @hour }
    end
  end
  
  # GET /hours/1/edit
  def edit
    @hour = Hour.find(params[:id])
  end
  
  # POST /hours
  # POST /hours.xml
  def create
    @hour = Hour.new(params[:hour])
    @hour.user = current_user
    
    respond_to do |format|
      if @hour.save
        format.html { redirect_to(hours_path, :notice => 'Hour was successfully created.') }
        format.xml  { render :xml => @hour, :status => :created, :location => @hour }
      else
        format.html {
          @hours = Hour.find_all_by_user_id(current_user.id)
          render :action => "index"
        }
        format.xml  { render :xml => @hour.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /hours/1
  # PUT /hours/1.xml
  def update
    @hour = Hour.find(params[:id])

    respond_to do |format|
      if @hour.update_attributes(params[:hour])
        format.html { redirect_to(@hour, :notice => 'Hour was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hour.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hours/1
  # DELETE /hours/1.xml
  def destroy
    @hour = Hour.find(params[:id])
    @hour.destroy

    respond_to do |format|
      format.html { redirect_to(hours_url) }
      format.xml  { head :ok }
    end
  end
end
