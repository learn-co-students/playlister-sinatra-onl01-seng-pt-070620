# Add seed data here. Seed your database with `rake db:seed`
Artist.create(:name => "Drake") #hip hop
Artist.create(:name => "Madonna") #pop
Artist.create(:name => "Katy Perry") #pop

Genre.create(:name => "Rock")
Genre.create(:name => "Jazz")
Genre.create(:name => "Hip Hop")
Genre.create(:name => "Pop")

Song.create(:name => "Hung Up" ,:artist_id => 2)
Song.create(:name => "Material Girl" ,:artist_id => 2)
Song.create(:name => "Gods Plan" ,:artist_id => 1)

SongGenre.create(:song_id => 1, :genre_id => 4)
SongGenre.create(:song_id => 2, :genre_id => 4)
SongGenre.create(:song_id => 3, :genre_id => 3)

