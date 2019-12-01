class PropertyTypeService
  def self.build
    @build ||= new(
      data: YAML.safe_load(
        File.read(
          Rails.root.join("config", "property_types.yml")
        )
      ).fetch("property_types")
    )
  end

  def initialize(data:)
    @data = data
  end

  def value_for(type)
    data.fetch(type).fetch("value").to_i
  end

  private

  attr_reader :data
end
