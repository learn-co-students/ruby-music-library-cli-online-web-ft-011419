class MusicLibraryController
  
  attr_accessor :path
  
  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end
  
  def call
    loop do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      answer = gets.chomp
      break if answer == 'exit'
      
      case answer
      
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
    counter = 1
    song_array = []
    songs = Song.all.sort_by { |song| song.name }

    songs.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      song_array << "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end
    song_array
  end
  
  def list_artists
    counter = 1
    artists = Artist.all.sort_by { |artist| artist.name }
    #binding.pry
    artists.each do |artist|
      puts "#{counter}. #{artist.name}"
      counter += 1
    end
  end
  
  def list_genres
    counter = 1
    genres = Genre.all.sort_by { |genre| genre.name }
    #binding.pry
    genres.each do |genre|
      puts "#{counter}. #{genre.name}"
      counter += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    answer = gets.chomp
    
    counter = 1
    songs = Song.all.sort_by { |song| song.name }
    #binding.pry
    songs.each do |song|
      if song.artist.name == answer
      puts "#{counter}. #{song.name} - #{song.genre.name}"
      counter += 1
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    answer = gets.chomp
    
    counter = 1
    songs = Song.all.sort_by { |song| song.name }
    #binding.pry
    songs.each do |song|
      if song.genre.name == answer
      puts "#{counter}. #{song.artist.name} - #{song.name}"
      counter += 1
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    answer = gets.chomp.to_i
    
    if (1..Song.all.length).include?(answer) 
    song = Song.all.sort_by { |song| song.name }[answer - 1]
    puts "Playing #{song.name} by #{song.artist.name}"
    end
  
  end
  
end