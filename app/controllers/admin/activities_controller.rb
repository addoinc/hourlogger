class Admin::ActivitiesController < ApplicationController
  
  before_filter :login_required
  before_filter :ensure_admin
  
  def index
    @activities = Activity.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activities }
    end    
  end
  
  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(params[:activity])
    if @activity.save
      redirect_to(admin_activities_path, :notice => 'Activity was successfully created.')
    else
      render :action => "new"
    end
  end
  
  def edit
    @activity = Activity.find(params[:id])
  end
  
  def update
    @activity = Activity.find(params[:id])
    @activity.attributes = params[:activity]
    if @activity.save
      redirect_to admin_activities_path, :notice => "Activity was successfully updated."
    else
      render :action => "edit"
    end
  end
  
  def destroy
    activity = Activity.find(params[:id])
    if activity.hours.count > 0
      flash[:error] = "Activity can't be deleted since there are hours logged for it!"
      redirect_to admin_activities_path
    else
      activity.destroy
      redirect_to admin_activities_path, :notice => "Activity was successfully deleted!"
    end
  end
  
end
