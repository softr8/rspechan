module Api
  class BuildsControllerController < BaseController

    protect_from_forgery except: [:finish_build]

    def finish_build
      build = Build.find(params[:id])
      head status: build.finished ? :ok : :unprocessable_entity
    end
  end
end