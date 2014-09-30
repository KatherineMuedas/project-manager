class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  def index
    @projects = Project.all.includes(:user) 
  end

  def new 
    @project = current_user.projects.new
    @project.tasks.build
  end

  def create  
    @project = current_user.projects.create(project_params)
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.' 
    else
      render :new 
    end 
  end

  def show
    @tasks = @project.tasks.includes(:user)
  end

  def edit
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to @project, notice: 'Project was successfully updated.' 
    else
      render :edit 
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    tasks_attributes = [:id, :name, :description, :is_completed, :delivery_minutes, :assign_to, :project_id, :user_id, :_destroy]
    params.require(:project).permit(:name, :description, :due_date_at, tasks_attributes: tasks_attributes)
  end

end
