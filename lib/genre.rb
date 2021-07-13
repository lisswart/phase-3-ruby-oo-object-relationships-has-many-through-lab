require "pry"
require_relative "./song.rb"
require_relative "./artist.rb"

class Genre
    attr_accessor :name
    @@all =[]

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all {|song| song.genre == self}
    end

    def artists
        songs.map do |song|
            song.artist
        end
    end

    def add_song(name, artist)
        Song.new(name, artist, self)
    end
end

jay_z = Artist.new('Jay-Z')
kendrick = Artist.new('Kendrick Lamar')
rap = Genre.new('rap')
ninety_nine_problems = Song.new('99 Problems', jay_z, rap)
humble = Song.new('HUMBLE', kendrick, rap)

# binding.pry