max_entries = 20
entries_to_create = max_entries - Entry.count

entries_to_create.times do
  entry_hash = { author: Faker::Name.name, title: Faker::Lorem.sentence(1, true), body: Faker::Lorem.paragraph(2, true) }

  entry = Entry.new(entry_hash)
  entry.save!
end
