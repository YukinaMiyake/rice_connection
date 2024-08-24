# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin@example.com',
  password: 'password'
)

genre_names = %w(
        北海道
        青森県
        岩手県
        秋田県
        宮城県
        福島県
        山形県
        福島県
        茨城県
        栃木県
        群馬県
        埼玉県
      )
genres = genre_names.map { |name| Genre.create!(name: name) }

(1..5).each do |i|
  producer = Producer.create!(
    first_name: Faker::Japanese::Name.first_name,
    last_name: Faker::Japanese::Name.last_name,
    email: "producer#{i}@test.com", 
    password: "password",
    postal_code: "000000#{i}",
    address: "xxxxxxxxxxxxxxxx",
    telephone_number: "0#{i}0-000-0000"
  )
  
  (1..rand(1..5)).each do |n|
    producer.items.create!(
      name: "item#{i}-#{n}",
      introduction: "xxxxx" * rand(3..5),
      price: [2000, 3000, 4000].sample,
      stock: rand(1..10),
      genre_id: genres.sample.id
    )
  end
  
  (1..rand(1..3)).each do |n|
    producer.posts.create!(
        item_id: producer.items.sample.id,
        title: "post#{i}-#{n}",
        body: "xxxxx" * rand(5..10)
      )
  end
end

posts = Post.all

(1..3).each do |i|
  consumer = Consumer.create!(
    first_name: Faker::Japanese::Name.first_name,
    last_name: Faker::Japanese::Name.last_name,
    email: "consumer#{i}@test.com",
    password: "password",
    postal_code: "000000#{i}",
    address: "xxxxxxxxxxxxxxxx",
    telephone_number: "0#{i}0-000-0000"
  )
  
  (1..rand(1..3)).each do |n|
    consumer.post_comments.create!(
        post_id: posts.sample.id,
        content: "xxxxx" * rand(3..5)
      )
  end
end

