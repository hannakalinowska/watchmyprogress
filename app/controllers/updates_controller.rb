class UpdatesController < ApplicationController
  def new
    @project = current_user.projects.find(params[:project_id])
    @update = @project.updates.build

    render :layout => false if request.xhr?
  end

  def create
    @project = current_user.projects.find(params[:project_id])
    @update = @project.updates.build(params[:update])
    if @update.save
      flash[:notice] = 'Update added!'
      redirect_to projects_path
    else
      render :new
    end
  end
end
