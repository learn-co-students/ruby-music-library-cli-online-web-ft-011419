class MusicLibraryController

  def initialize(file_path = "./db/mp3s")
    MusicImporter.new(file_path).import
  end

  def call

    user_input = ""

    while user_input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

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
    song_array = Song.all.sort_by! {|song| song.name}
    song_array.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    artists_array = Artist.all.sort_by! {|artist| artist.name}
    artists_array.each_with_index {|artist, index| puts "#{index+1}. #{artist.name}"}
  end

  def list_genres
    genres_array = Genre.all.sort_by! {|genre| genre.name}
    genres_array.each_with_index {|genre, index| puts "#{index+1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
    if Artist.find_by_name(user_input) != nil
      songs_array = Artist.find_by_name(user_input).songs.sort_by! {|song| song.name}
      songs_array.each_with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
    if Genre.find_by_name(user_input) != nil
      songs_array = Genre.find_by_name(user_input).songs.sort_by! {|song| song.name}
      songs_array.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.chomp.to_i
    if (1..Song.all.length).include? (user_input)
      song = Song.all.sort_by! {|song| song.name}[user_input - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
