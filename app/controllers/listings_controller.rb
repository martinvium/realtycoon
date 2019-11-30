class ListingsController < ApplicationController
  def index
    @listings = Listing.active
  end

  def create
  end

  def update
  end
end
