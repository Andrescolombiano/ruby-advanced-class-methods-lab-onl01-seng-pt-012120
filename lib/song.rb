class Song 
  attr_accessor :name, :artist_name   # we'r telling our accesor that our object is gonna have a name property
                                       # our accessor allows us to read and write that property
  @@all = []
  
  def self.all                        #return the context of all the array
   @@all
  end 
  
  def self.create               # instantiates and saves a song with a name property  # class method
    new_obj = self.new          # instantiates a Song        # song = self.new
    @@all << new_obj            # save the Song              # @@all << self
    new_obj                     # return the song 
  end 
  
  def self.new_by_name (name)     #instantiates a song with name property so we need the accesor
    song = self.new               #first we instantite a song    # song = Song.new
    song.name = name              #set the song.name equal to the argument passed "name"
    song                          #return the modified object
  end
  
  def self.create_by_name (song_name)     #instantiates and saves a song with a name property
    song= self.create
    song.name = song_name          # invoking your properties that you give your objects
    song                          # the way that we acces those properties like:
   end                                 # - if we want to call it to read it or 
                                    # - if you want to call it to write it
                               # would be by this dot (.) and the property that we need.
  
  
  def self.find_by_name (song_name)               # can find a song present in @@all by name 
    @@all.find {|song|song.name == song_name}       # find the song and give the song that matches 
  end                                             # or returns falsey when a song name is not present in @@all
  
  def self.find_or_create_by_name (song_name)                           # invokes .find_by_name and .create_by_name instead of repeating code
    self.find_by_name(song_name) || self.create_by_name(song_name)      # returns the existing Song object or       conditional
  end                                                                          #(doesn't create a new one) when provided the title of an existing Song 
                                                                        # creates a new Song object with the provided title if one doesn't already exist 
  
  def self.alphabetical                                          #returns all the song instances in alphabetical order by song name
    @@all.sort_by {|song_name|song_name.name}
  end  
    
  def self.new_from_filename (filename)
  # filename = "Taylor Swift - Blank Space.mp3"
  # return a new song instance
  # set song name to name of song "blank space"
  # set artist_name to name of artist "Taylor Swift"
  # parse the filename for song name and artist name
  # separate artist name at -
  # remove the .mp3 from song name
    
   info = filename.split (" - ")
   song = self.new                     #created a new song_object
   song.name = info[1].chomp(".mp3")   #set to name of this song = name of song in file and remove .mp3
   song.artist_name = info[0]          #set to name of artist_name = name of artist
   song
  end 
    
  def self.create_from_filename (filename)
   info = filename.split (" - ")
   song = self.create                    #created a new song_object
   song.name = info[1].chomp(".mp3")   #set to name of this song = name of song in file and remove .mp3
   song.artist_name = info[0]          #set to name of artist_name = name of artist
   song
  end
  
  def self.destroy_all               # clears all the song instances from the @@all array
    @@all.clear
  end
end



  
  