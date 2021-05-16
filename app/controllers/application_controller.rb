class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  layout "application"

  include Authenticatable

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  rescue_from ActionController::ParameterMissing do |parameter_missing|
    render json: { errors: parameter_missing.message },
           status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordInvalid do |invalid_record|
    render json: { errors: invalid_record.message },
           status: :unprocessable_entity
  end

  private

  def not_found
    render json:  { errors: 'Not found' },
           status: :not_found
  end
end
