Company.create!(
  name: "Company 1",
  cash: 10_000_000_00
)

city = City.create!(
  name: "Helsingør",
  appeal: 10
)

city.streets.create!(
  [
    {name: "Ryesvej", appeal: 10},
    {name: "Tordenskjoldsvej", appeal: 10},
    {name: "Bülowsvej", appeal: 10},
    {name: "Læssøesvej", appeal: 10},
    {name: "Fredereciavej", appeal: 10},
  ]
)

city.streets.each do |street|
  (1..5).each do |number|
    property = street.properties.create!(
      number: number,
      type: %w[a b c d].sample,
      constructed_at: DateTime.new(1983, 10, 1),
    )

    valuation_service = PropertyValuationService.build
    Listing.create!(property: property, price: valuation_service.value_for(property))
  end
end
