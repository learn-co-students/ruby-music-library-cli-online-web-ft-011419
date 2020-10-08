require 'pry'
class MusicLibraryController
  attr_accessor :importer
  def initialize(path="./db/mp3s")
    @importer = MusicImporter.new(path)
    importer.import
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
    user_input = ""
    until user_input == "exit"
    user_input = gets.chomp
    case user_input
    when "list songs"
      list_songs
    when "list artists"
      list_artists
    when "list genres"
      list_genres
    when "list artist"
      list_songs_by_artist
    when "list genre"
      list_songs_by_genre
    when "play song"
      play_song
    end
    end
  end

  def list_songs
    sorted_song_names = Song.all.sort_by {|song| song.name}
    sorted_song_names.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists

    sorted_artist_names = Artist.all.sort {|artist1, artist2| artist1.name<=>artist2.name}

    sorted_artist_names.each_with_index {|artist, index| puts "#{index+1}. #{artist.name}"}

  end

  def list_genres
    sorted_genres = Genre.all.sort_by {|genre| genre.name}
    sorted_genres.each_with_index {|genre, index| puts "#{index+1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
      if Artist.find_by_name(user_input)
        artist = Artist.find_by_name(user_input)
        artist.songs.sort_by {|song| song.name}.each_with_index {|song, index| puts "#{index+1}. #{song.name} - #{song.genre.name}"}
     end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
    if Genre.find_by_name(user_input)
      genre = Genre.find_by_name(user_input)
      genre.songs.sort_by {|song| song.name}.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.chomp.to_i
    # binding.pry
    if user_input.to_i > 0 && user_input.to_i < Song.all.length
      sorted_song_names = Song.all.sort_by {|song| song.name}
      song = sorted_song_names[user_input-1]
      puts "Playing #{song.name} by #{song.artist.name}"
 end
  end

  def sorted_songs
    sorted_song_names = Song.all.sort_by {|song| song.name}
    sorted_songs_stuff = sorted_song_names.each_with_index {|song, index| "#{index+1}. #{song.name} by #{song.artist.name}"}
  end
end
