class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    user_input = nil
    until user_input == "exit"
      user_input = gets.strip
    end
  end

  def list_songs
    song_array = []
    count = 0
    Song.all.each do |song|
      song_array << song.name + " - " + song.artist.name + " - " + song.genre.name
    end
    song_array.sort.each do |song|
      reorder = song.split(" - ")
      count += 1
      puts "#{count}. #{reorder[1]} - #{reorder[0]} - #{reorder[2]}"
    end
  end

  def list_artists

  end


end
