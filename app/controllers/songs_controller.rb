class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all
        @artists = Artist.all
        erb :'/songs/new'
    end

    get '/songs/:slug' do
        # binding.pry
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    post '/songs' do
        
        @song = Song.create(params["song"])
        if !params["artist"]["name"].empty?
            @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
            @song.save
        end
        params["genre_ids"].each do |genre_id|
            @song.song_genres.create(genre_id: genre_id)
        end
        flash[:message] = "Successfully created song."
        redirect "/songs/#{@song.slug}"

    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        # binding.pry
        @genres = Genre.all
        erb :'/songs/edit'
    end

    patch '/songs/:slug' do 
       
        @song = Song.find_by_slug(params[:slug])
        artist = Artist.find(@song.artist.id)
        artist.update(:name => params["artist_name"])
        @song.update(:name => params["name"], :artist => artist)
        
        #find better way for below code
        @song.song_genres.each do |song_genre|
            song_genre.delete
        end

        params["genre_ids"].each do |genre_id|
            # @song.song_genres.find_or_create_by(genre_id: genre_id)
            @song.song_genres.create(genre_id: genre_id)
        end
       
        flash[:message] =  "Successfully updated song."
        erb :'/songs/show'
    end
 
end