User.create!(name: 'Example User',
             email: 'example@example.com')

24.times do
  name = Faker::Name.name
  email = Faker::Internet.email
  User.create!(name: name,
               email: email)
end

Event.create!(title: "Example Event Today",
              description: "Today will be this example event.",
              date: Date.today,
              location: "Example Location",
              creator_id: 1)

34.times do
  title = Faker::Hipster.sentence(Random.rand(1..5), true, 4)[0...-1]
  description = Faker::Hipster.paragraphs(Random.rand(1..3), true).join("\n\n")
  date = Faker::Date.between(1.year.ago, 1.year.from_now)
  location = Faker::Address.street_address
  creator_id = Random.rand(1..User.count)
  Event.create!(title: title,
                description: description,
                date: date,
                location: location,
                creator_id: creator_id)
end

Event.find_each do |event|
  attendees = Random.rand(1..10)
  attendees.times do
    Attending.create!(attended_event_id: event.id,
                      attendee_id: Random.rand(1..User.count))
  end
end
