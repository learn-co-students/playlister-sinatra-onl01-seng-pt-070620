# Add seed data here. Seed your database with `rake db:seed`
LibraryParser.parse

# library.map do |listing|
#     list = listing.gsub(".mp3", "").gsub(" -", "")
#     listed = list.split(" - ")
    
#     artist = listed[0]
#     artist_hash = {name: artist} 
    
#     song_and_genre = listed[1]
#     song_and_genre_split = song_and_genre.split()
#     genre = song_and_genre_split.last.gsub("[", "").gsub("]", "")
#     genre_hash = {name: genre}
    
#     Artist.create(artist_hash)
#     Genre.create(genre_hash)
# end