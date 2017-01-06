# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'ffaker'

City.destroy_all
Post.destroy_all

# user = User.last
# user.posts.create([
#   {title: "San Francisco",
#     content: "Awesome"},
#   {title: "New York",
#     content: "Beautiful"},
#     {title: "Hong Kong",
#       content: "Delicious food"},
#       {title: "Los Angeles",
#       content: "Awful traffic!"}
#   ]);

# Post.create([
#     {title: "San Francisco",
#       content: "Awesome"},
#     {title: "New York",
#       content: "Beautiful"},
#       {title: "Hong Kong",
#         content: "Delicious food"},
#         {title: "Los Angeles",
#         content: "Awful traffic!"}
#     ]);
# user.posts << Post.last

City.create([{
  name: "San Francisco",
  image: "http://images.unsplash.com/photo-1414005987108-a6d06de8769f"
  },
  {
    name: "London",
    image: "https://images.unsplash.com/photo-1473896100090-53523650d4c6"
  },
  {
    name: "Gibraltar",
    image: "https://images.unsplash.com/photo-1468618367903-e50d699d4f78"
    },
    {
      name: "Seoul",
      image: "http://www.travelingeast.com/wp-content/uploads/2013/09/Seoul.jpg"
      },
      {
        name: "Chengdu",
        image: "https://images.unsplash.com/photo-1462803966231-b88ec09ff42a"
        },
        {
          name: "Kharkov",
          image: "http://www.lea-shans.kharkov.ua/articles/img/pics/uzhd.jpg"
          }
  ]);

user = User.last
city1 = City.last
# city2 = City.first
post = user.posts.create([{title: "San Francisco",
      content: "Awesome",
      city_id: city1.id},
      {
        title: "San Francisco",
        content: "Awesome~ this is created later",
        city_id: city1.id}
        ])
