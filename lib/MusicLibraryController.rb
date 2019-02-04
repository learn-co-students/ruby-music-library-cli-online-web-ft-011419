class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
    import = import
  end
  
  def call
    
    user = ""
    
    while user != "exit"
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    user = gets.chomp
    
    case user
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
     Song.all.sort{|a,b| a.name <=> b.name}.each.with_index(1) do |ls, index|
       puts "#{index}. #{ls.artist.name} - #{ls.name} - #{ls.genre.name}"
     end
   end
  def list_artists
     Artist.all.sort{|a,b| a.name <=> b.name}.each.with_index(1) do |la, index|
       puts "#{index}. #{la.name}"
     end
   end
   
  def list_genres
     Genre.all.sort{|a,b| a.name <=> b.name}.each.with_index(1) do |lg, index|
       puts "#{index}. #{lg.name}"
     end
   end
   
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user = gets.chomp
    if artist = Artist.find_by_name(user)
      artist.songs.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |sl, index|
        puts "#{index}. #{sl.name} - #{sl.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user = gets.chomp
    if genre = Genre.find_by_name(user)
      genre.songs.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |sl, index|
        puts "#{index}. #{sl.artist.name} - #{sl.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user = gets.chomp.to_i
    if (1..Song.all.length).include?(user)
      song = Song.all.sort{|a, b| a.name <=> b.name}[user - 1]
    end
    
    puts "Playing #{song.name} by #{song.artist.name}" if song
  end
end