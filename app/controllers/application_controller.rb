class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :fetch_projects



  private
  def fetch_projects
    @active_projects = Project.all
  end
end
