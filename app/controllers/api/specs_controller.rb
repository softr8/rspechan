class Api::SpecsController < BaseController

  skip_before_filter :verify_authenticity_token, only: :create_failures

  def create_failures
    JSON.parse(params[:specs]).each do |failing_spec|
      SpecTest.create(failing_spec)
    end

    build = Build.find_by_id(params[:build_id])
    build.failed! if build
    render nothing: true
  end
end