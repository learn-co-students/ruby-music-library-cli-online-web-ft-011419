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
      if user_input == "list songs"
        self.list_songs
      elsif user_input == "list artists"
        self.list_artists
      elsif user_input == "list genres"
        self.list_genres
      elsif user_input == "list artist"
        self.list_songs_by_artist
      elsif user_input == "list genre"
        self.list_songs_by_genre
      elsif user_input == "play song"
        self.play_song
      end
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
    artist_array = []
    count = 0
    Artist.all.each do |artist|
      artist_array << artist.name
    end
    artist_array.uniq.sort.each do |artist|
      count += 1
      puts "#{count}. #{artist}"
    end
  end

  def list_genres
    genre_array = []
    count = 0
    Genre.all.each do |genre|
      genre_array << genre.name
    end
    genre_array.uniq.sort.each do |genre|
      count += 1
      puts "#{count}. #{genre}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    artist_songs = []
    count = 0
    Artist.all.each do |artist|
      if artist.name == user_input
        artist.songs.each do |song|
          song_genre = song.name + " - " + song.genre.name
          artist_songs << song_genre
        end
      end
    end
    artist_songs.sort.each do |artist|
      count +=1
      puts "#{count}. #{artist}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.strip
    genre_songs = []
    count = 0

    Genre.all.each do |genre|
      if genre.name == user_input
        genre.songs.each do |song|
          genre_song = song.name + " - " + song.artist.name
          genre_songs << genre_song
        end
      end
    end

    abc_songs = genre_songs.sort.collect do |song|
      split_song = song.split(" - ")
      new_song = split_song[1] + " - " + split_song[0]
    end

    abc_songs.each do |song|
      count += 1
      puts "#{count}. #{song}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_array = []
    user_input = gets.strip.to_i
    Song.all.each do |song|
      song_array << song.name + " - " + song.artist.name + " - " + song.genre.name
    end
    if user_input > 0 && user_input <= song_array.count
      abc_array = song_array.sort[user_input - 1].split(" - ")
      puts "Playing #{abc_array[0]} by #{abc_array[1]}"
    end
  end
end
