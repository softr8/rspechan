class BaseController < ApplicationController
  before_filter :set_organization
  before_filter :fetch_projects

  private

  def set_organization
    OrganizationHelper.default_id = params[:organization_id]
    @organization = Organization.find_by_id(params[:organization_id])
  end

  def fetch_projects
    @active_projects = Project.all
  end

end