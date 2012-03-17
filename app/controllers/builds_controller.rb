class BuildsController < ApplicationController
  # GET /builds
  # GET /builds.json
  def index
    @builds = Build.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @builds }
    end
  end

  # GET /builds/1
  # GET /builds/1.json
  def show
    @build = Build.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @build }
    end
  end

  # GET /builds/new
  # GET /builds/new.json
  def new
    @build = Build.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @build }
    end
  end

  def enqueue
    Build.create(project_id: params[:project_id])
    redirect_to organization_path(OrganizationHelper.default_id)
  end


end
