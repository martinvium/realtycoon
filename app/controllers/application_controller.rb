class ApplicationController < ActionController::Base
  helper_method :current_company

  def current_company
    Company.last
  end
end
