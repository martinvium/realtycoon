class PropertiesController < ApplicationController
  def index
    @properties = current_company.properties
  end

  def show
    @property = current_company.properties.find(params[:id])
    @value = property_valuation_service.value_for(@property)
  end

  private

  def property_valuation_service
    PropertyValuationService.new(property_type_service: PropertyTypeService.build)
  end
end
