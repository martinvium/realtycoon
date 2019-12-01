class ApplicationController < ActionController::Base
  def current_company
    Company.last
  end
end
