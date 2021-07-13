class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        # returns all songs associated with this artist
        Song.all.select {|song| song.artist == self}
    end

    def new_song(name, genre)
        # given a name and genre, creates a new song
        Song.new(name, self, genre)
    end

    def genres
        # has many genres, through songs
        songs.map do |song|
            song.genre
        end
    end

end
