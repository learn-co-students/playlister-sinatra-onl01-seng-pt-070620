require 'rack-flash'

class SongsController < Sinatra::Base
    register Sinatra::ActiveRecordExtension
    set :session_secret, "my_application_secret"
    set :views, Proc.new { File.join(root, "../views/") }
    use Rack::Flash 

    get '/songs' do 
        @songs = Song.all 
        erb :'songs/index'
    end 

    get '/songs/new' do
        erb :'/songs/new'
      end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
      end

      post '/songs' do
        @song = Song.create(params[:song])
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song.genre_ids = params[:genres]
        @song.save
       # binding.pry
         flash[:message] = "Successfully created song."
         binding.pry 
         redirect to("/songs/#{@song.slug}")
        #erb :"/songs/show", locals: {message: "Successfully created song."}

      end

      get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
      
        erb :'songs/edit'
      end
      
      patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
      
        @song.update(:artist => params[:artist], :genre => params[:genre])
      
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song.save
         flash[:message] = "Successfully created song."
        redirect to("/songs/#{@song.slug}")
       # erb :"/songs/show", locals: {message: "Song successfully updated."}

      end
end 
