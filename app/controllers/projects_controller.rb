class ProjectsController < ApplicationController
  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(params[:project])
    if @project.save
      flash[:notice] = 'Project successfully created.'
      redirect_to projects_path
    else
      render :new
    end
  end
end
