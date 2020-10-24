class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
        self.name.downcase.strip.gsub(' ', '-')
    end

    def self.find_by_slug(slug)
        name = slug.split('-').map(&:capitalize).join(' ')
        # slug.split('-').each {|word| word.capitalize!}.join(' ')
        Artist.find_by(:name => name)
    end
end