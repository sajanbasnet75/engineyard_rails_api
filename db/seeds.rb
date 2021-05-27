# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Hotel.present?
  Hotel.create!(name: 'Sunseeker Resort',
                description: 'Discover a bolder, brighter Gulf Coast experience at Sunseeker Resort Charlotte Harbor, a fresh and fabulous destination with stunning waterfront views, incredible amenities, and a world-class collection of restaurants and bars. Sun-drenched and situated in brilliant and beautiful Charlotte Harbor, our resort brings breezy Florida luxury directly to you. From our chic hotel to unforgettable Sun Suite Residences™, this is a premier paradise just moments from Punta Gorda. Smile freely, laugh often, and let go of your worries when you soak up the sun with us.
                            Whether you’re staying for a few days or an entire season, we believe that you deserve the absolute best. And there’s no place better to stay in Southwest Florida than Sunseeker Resort Charlotte Harbor. Relax in a well-appointed hotel room or make yourself at home in a luxe Sun Suite Residence™. Enjoy awesome onsite amenities, smartly integrated technology, and contemporary coastal style, all just minutes from five airports — Punta Gorda, Fort Myers, Tampa, St. Pete, and Sarasota. Getting and thriving here is so simple, and simply amazing.
                           Welcome to Sunseeker Resort Charlotte Harbor, your piece of the sun.')
end
