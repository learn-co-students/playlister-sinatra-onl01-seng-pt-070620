class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        self.name.downcase.gsub(" ", "-")
      end

    def self.find_by_slug(slug)
        Song.all.find { |song| song.slug == slug }
        
        #name = slug.gsub("-", " ").split().map{|n| n.capitalize}.join(" ")

        #Song.find_by(name: name)
    end
end