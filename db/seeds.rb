# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create([{name: 'Software'},
                              {name: 'Audio'},
                              {name: 'Anime'},
                              {name: 'Literature'},
                              {name: 'Live Action'},])
status = Status.create([{name: 'normal'},
                        {name: 'remake'},
                        {name: 'trusted'},
                        {name: 'a+'},])
sub_categories = SubCategory.create([{name: 'Applications'},
                                     {name: 'Games'},
                                     {name: 'Lossless Audio'},
                                     {name: 'Lossy Audio'},
                                     {name: 'English-translated Anime'},
                                     {name: 'Raw Anime'},])

200.times do
  name = Faker::Book.title
  hash = Faker::Crypto.md5
  category_id = 1
  status_id = rand(1..4)
  sub_category_id = rand(1..2)
  Torrent.create!(name: name, torrent_hash: hash, category_id: category_id,
                  status_id: status_id, sub_category_id: sub_category_id)
end

