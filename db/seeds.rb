Company.create!(
  name: "Company 1",
  cash: 1_000_000
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
      type: "villa",
      floors: 2,
      rooms: 4,
      constructed_at: DateTime.new(1983, 10, 1),
      seed: "abcd"
    )

    Listing.create!(property: property, price: 250_000)
  end
end
