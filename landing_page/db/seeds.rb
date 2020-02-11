# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.order(:created_at).take(1)
2.times do
    content = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 2)
    users.each { |user| user.microposts.create!(content: content)}
end