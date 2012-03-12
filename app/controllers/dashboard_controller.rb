class DashboardController < ApplicationController
  def index
    @feeds = Project.latest_built
  end
end
