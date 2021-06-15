# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "sampleTarou", email: "tarou@example.com", password: "hogehoge", password_confirmation: "hogehoge")
User.create(name: "okubotakumi", email: "taku0828mi@icloud.com", password: "taku0828", password_confirmation: "taku0828")
Blog.destroy_all
  5.times do |i|
    blog = Blog.create(title: "テストデータ#{i}", body: "本文は１０文字以上が必要#{i}")
    5.times do |j|
    blog.comments.create(body: "コメント本文は必須 #{j}")
  end
  
end
