class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists , through: :songs

    def slug
        self.name.downcase.strip.gsub(' ', '-')
    end

    def self.find_by_slug(slug)
        name = slug.split('-').map(&:capitalize).join(' ')
        Genre.find_by(:name => name)
    end
end