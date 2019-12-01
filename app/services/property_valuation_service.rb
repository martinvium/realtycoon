class PropertyValuationService
  def self.build
    new(property_type_service: PropertyTypeService.build)
  end

  def initialize(property_type_service:)
    @property_type_service = property_type_service
  end

  def value_for(property)
    (1 + property.street.appeal / 100) * @property_type_service.value_for(property.type)
  end
end
