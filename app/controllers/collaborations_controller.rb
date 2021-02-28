class CollaborationsController < ApplicationController
  before_action :set_collaboration, only: %i[ update destroy ]
  before_action :set_project, only: %i[ create edit destroy ]
  before_action :authenticate_user!

  def new
  end

  def create
    @collaboration = Collaboration.new(collaboration_params)
    # @project = Project.find(params[:project_id])
    @collaboration.project = @project
    @collaboration.user = current_user
    authorize @collaboration
      if @collaboration.save
        redirect_to @project
        flash[:notice] = "You submitted a request to collaborate for the project #{@project.title}. Now go create something while you wait for approval!"
      else
        render :new
      end
  end

  def edit
    # @project = Project.find(params[:project_id])
    @collaboration = Collaboration.find(params[:id])
    authorize @collaboration
  end

  def update
    authorize @collaboration
    if @collaboration.update(collaboration_params)
      redirect_to project_path(@collaboration.project)
      flash[:notice] = " Collaboration was edited"
    else
      render :edit
    end
  end

  def destroy
    # @project = Project.find(params[:project_id])
    @collaboration.destroy
    authorize @collaboration
    redirect_to @project
  end

  def confirm
    # Gets current page to redirect later
    session[:return_to] ||= request.referer

    @collaboration = Collaboration.find(params[:id])
    if @collaboration.confirmed == true
      @collaboration.confirmed = false
      flash[:notice] = "Collaboration was denied"
      # @collaboration.status = denied
    else
      @collaboration.confirmed = true
      flash[:notice] = "Collaboration was accepted"
    end

    authorize @collaboration
    @collaboration.save

    # Redirects to previous page
    redirect_to session.delete(:return_to)

  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_collaboration
    @collaboration = Collaboration.find(params[:id])
  end

  def collaboration_params
    params.require(:collaboration).permit(:project_id, :user_id, :status, :role, :message, :created_at, :updated_at, :confirmed)
  end
end
