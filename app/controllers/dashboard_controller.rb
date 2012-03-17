class DashboardController < BaseController
  def index
    @feeds = Project.latest_built
  end
end
