# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Post.delete_all
User.delete_all
Tag.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('users') #Hace que los id se reestablezcan, es decir, que empiecen del 1
ActiveRecord::Base.connection.reset_pk_sequence!('posts') #Hace que los id se reestablezcan, es decir, que empiecen del 1
ActiveRecord::Base.connection.reset_pk_sequence!('tags') #Hace que los id se reestablezcan, es decir, que empiecen del 1


#5 usuarios con al menos una publicacion cada uno
5.times do |n|
    user = User.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password,
    )

    #Al menos una publicacion para cada usuario
    post = user.posts.create(
        title: Faker::Lorem.sentence,
        content: Faker::Lorem.paragraph
    )

    #Asociar al menos una etiqueta a cada publicacion
    tag = Tag.create(name: Faker::Lorem.word)
    post.tags << tag

end

#5 etiquetas
5.times do |n|
    Tag.create(name: Faker::Lorem.word)
end

#Asociacion de las etiquetas con las publicaciones
Post.all.each do |post|
    #Al menos una etiqueta para cada publicacion
    tag = Tag.order("RANDOM()").first
    post.tags << tag
end

#Verificar que cada etiqueta este asociada con al menos una publicacion
Tag.all.each do |tag|
    #Si no tiene ninguna asociacion se crea una publicacion
    if tag.posts.empty?
        user = User.order("RANDOM()").first
        post = user.posts.create(
            title: Faker::Lorem.sentence,
            content: Faker::Lorem.paragraph
        )
        tag.posts << post
    end
end
