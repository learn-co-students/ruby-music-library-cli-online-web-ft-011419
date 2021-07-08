require 'pry'
class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end
  
  def call
    userinput = String.new
    until userinput == "exit"
    
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      #binding.pry
      userinput = gets.chomp
      
      if userinput == "list songs"
        list_songs
      elsif userinput == "list artists"
        list_artists
      elsif userinput == "list genres"
        list_genres
      elsif userinput == "list artist"
        list_songs_by_artist
      elsif userinput == "list genre"
        list_songs_by_genre
      elsif userinput == "play song"
        play_song
      end
    end
  end
  
  def list_songs
    sorted_songs = Song.all.sort_by {|song| song.name}
    #binding.pry
    sorted_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      #binding.pry
    end
  end
  
  def list_genres
    sorted_genres = Genre.all.sort_by {|genre| genre.name}
    #binding.pry
    sorted_genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
      #binding.pry
    end
  end
  
  def list_artists
    sorted_artists = Artist.all.sort_by {|artist| artist.name}
    #binding.pry
    sorted_artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
      #binding.pry
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_to_list = gets.chomp
    #binding.pry
    
    found_artist = Artist.find_by_name(artist_to_list)
    
    if found_artist
      #binding.pry
      sorted_songs = found_artist.songs.sort_by {|song| song.name}
      sorted_songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
        #binding.pry
      end
      
    end
   
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_to_list = gets.chomp
    #binding.pry
    
    found_genre = Genre.find_by_name(genre_to_list)
    
    if found_genre
      #binding.pry
      sorted_genres = found_genre.songs.sort_by {|song| song.name}
      sorted_genres.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
        #binding.pry
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    song_choice = gets.chomp.to_i
    
    sorted_songs = Song.all.sort_by {|song| song.name}
    
    #song_choice += 1
    if song_choice != 0 && song_choice <= Song.all.size
      #binding.pry
      puts "Playing #{sorted_songs[song_choice - 1].name} by #{sorted_songs[song_choice - 1].artist.name}"
    end
    
    
  end
    
    
end