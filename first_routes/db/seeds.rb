# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.create(username: "Kevin")
u2 = User.create(username: "Frank")
u3 = User.create(username: "Martin Garrix")

a = Artwork.create(title: "Mona Leeza", artist_id: u.id, image_url: "Mona.com")

ArtworkShare.create(artwork_id: a.id, viewer_id: u2.id)
ArtworkShare.create(artwork_id: a.id, viewer_id: u3.id)
ArtworkShare.create(artwork_id: a.id, viewer_id: u.id)
