# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

AdvertsProjectsJoin.destroy_all
Project.destroy_all
Advert.destroy_all
User.destroy_all
City.destroy_all

City.create(name: 'Paris')
City.create(name: 'Biarritz')    
City.create(name: 'Lyon')
City.create(name: 'Marseille')

3.times do 
    User.create(
      first_name: Faker::Name.first_name, 
      last_name: Faker::Name.last_name, 
      description: Faker::Movie.quote,
      email: Faker::Name.first_name + "@yopmail.com",
      password: "123456",
      password_confirmation: "123456",
      picture: "https://fr.web.img4.acsta.net/newsv7/16/04/05/16/08/178817.jpg",
      user_type: "influencer", 
    )
    end

3.times do 
    User.create(
        first_name: Faker::Name.first_name, 
        last_name: Faker::Name.last_name, 
        description: Faker::Movie.quote,
        email: Faker::Name.first_name + "@yopmail.com",
        password: "123456",
        password_confirmation: "123456",
        picture: "https://disney-planet.fr/wp-content/uploads/2016/08/Kuzco-personnage-dans-kuzco-lempereur-megalo-03.jpg",
        user_type: "freelance", 
    )
    end
    
User.create(
    first_name: "Pablo", 
    last_name: "Blow", 
    description: Faker::Movie.quote,
    email: "pablo.blow@yopmail.com",
    password: "123456",
    password_confirmation: "123456",
    picture: "https://images-eu.ssl-images-amazon.com/images/I/41RutyIlzkL.jpg",
    user_type: "freelance",
    admin: true,
    )

6.times do 
    Project.create(
        description: Faker::Movie.quote,
        title: Faker::Movie.quote,
        picture: "https://images.pexels.com/photos/933964/pexels-photo-933964.jpeg?cs=srgb&dl=adolescent-adulte-amusement-assiette-933964.jpg&fm=jpg",
        user_id: User.where(user_type: "influencer").sample.id,
        link_field: "http://www.instagram.com",
        city_id: rand(1..4)
    )
end


tags = ["Monteur", "Graphiste", "Maquilleur", "Photographe"]

6.times do 
    Advert.create(
        description: Faker::Movie.quote, 
        picture: "https://images.assetsdelivery.com/compings_v2/kritchanut/kritchanut1406/kritchanut140600093.jpg",
        user_id: User.where(user_type: "freelance").sample.id,
        link_field: "http://www.twitter.com",
        price: rand(10...250),
        tag: tags[rand(0...3)],
        city_id: rand(1..4)
    )
end

1.times do 
    AdvertsProjectsJoin.create(
        advert_id: Advert.all.sample.id,
        project_id: Project.all.sample.id
    )
end
