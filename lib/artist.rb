class Artist

    @@all = []

    attr_accessor :name
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_by_name(name)
        @@all.find{ |artist| artist.name == name}
    end

    def self.create_by_name(name)
        artist = self.new(name)
        artist.name = name
        @@all << artist
        return artist
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) ? self.find_by_name(name) : self.new(name)
    end

    def print_songs
        self.songs.each { |song| puts song.name}
    end
end