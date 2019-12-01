class ListingsController < ApplicationController
  def index
    @listings = Listing.active
  end

  def show
    @listing = Listing.active.find(params[:id])
  end

  def create
    property = current_company.properties.find(params[:property_id])
    property.update!(company: nil)
    current_company.increment!(:cash, property.value)

    Listing.create(
      property: property,
      price: valuation_service.value_for(property)
    )

    redirect_to properties_path, notice: "Successfully sold property"
  end

  def update
    listing = Listing.active.find(params[:id])
    current_company.decrement!(:cash, listing.price)
    listing.property.update!(company: current_company)
    redirect_to property_path(listing.property), notice: "Successfully purchased property"
  end

  private

  def valuation_service
    PropertyValuationService.new(property_type_service: PropertyTypeService.build)
  end
end
