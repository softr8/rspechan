class Api::SpecsController < BaseController

  skip_before_filter :verify_authenticity_token, only: :create_failures

  def create_failures
    JSON.parse(params[:specs]).each do |failing_spec|
      Spec.create(failing_spec)
    end

    render nothing: true
  end
end