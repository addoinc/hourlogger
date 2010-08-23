class Admin::ProjectsController < ApplicationController
  
  before_filter :login_required
  before_filter :ensure_admin

  def index
    @projects = Project.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to(admin_projects_path, :notice => 'Project was successfully created.')
    else
      render :action => "new"
    end
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    @project.attributes = params[:project]
    if @project.save
      redirect_to admin_projects_path, :notice => "Project was successfully updated."
    else
      render :action => "edit"
    end
  end
  
  def destroy
    project = Project.find(params[:id])
    if project.hours.count > 0
      flash[:error] = "Project can't be deleted since there are hours logged for it!"
      redirect_to admin_projects_path
    else
      project.destroy
      redirect_to admin_projects_path, :notice => "Project was successfully deleted!"
    end
  end
  
end
