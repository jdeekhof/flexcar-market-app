class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  rescue_from ActiveRecord::RecordNotFound do |exception|
    Rails.logger.error(exception.message)
    Rails.logger.error(exception.backtrace.join("\n"))
    handle_record_not_found(exception)
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    Rails.logger.error(exception.message)
    Rails.logger.error(exception.backtrace.join("\n"))
    handle_record_invalid(exception)
  end


  private

  def record_not_found(exception:, path: nil)
    flash[:error] = "There was an issue finding this record, please try again."
    redirect_to path || root_path
  end

  def record_invalid(exception:, path: nil)
    flash[:error] = "There was an issue saving this record, please try again."
    Rails.logger.error(exception.message)
    Rails.logger.error(exception.backtrace.join("\n"))
    redirect_to path || root_path
  end
end
