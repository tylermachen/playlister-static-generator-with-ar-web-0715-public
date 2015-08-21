class SiteGenerator
  attr_accessor :rendered_path

  def initialize(url)
    @rendered_path = url
    FileUtils.mkdir_p(url)
    FileUtils.mkdir_p("#{url}/artists")
    FileUtils.mkdir_p("#{url}/genres")
    FileUtils.mkdir_p("#{url}/songs")
  end

  def generate
    build_index; build_artists_index; build_artist_page; build_genres_index
    build_genre_page; build_songs_index; build_song_page
  end

  def build_index
    @artists = Artist.all
    @genres = Genre.all
    @songs = Song.all
    t = File.read("app/views/index.html.erb")
    File.open("#{@rendered_path}/index.html", "w+") do |f|
      f.puts ERB.new(t).result(binding)
    end
  end

  def build_artists_index
    t = File.read("app/views/artists/index.html.erb")
    File.open("#{@rendered_path}/artists/index.html", "w+") do |f|
      f.puts ERB.new(t).result(binding)
    end
  end

  def build_artist_page
    t = File.read("app/views/artists/show.html.erb")
    Artist.all.each do |artist|
      @artist = artist # not sure why this is asked for in tests
      File.open("#{@rendered_path}/artists/#{artist.to_slug}.html", "w+") do |f|
        f.puts ERB.new(t).result(binding)
      end
    end
  end

  def build_genres_index
    t = File.read("app/views/genres/index.html.erb")
    File.open("#{@rendered_path}/genres/index.html", "w+") do |f|
      f.puts ERB.new(t).result(binding)
    end
  end

  def build_genre_page
    t = File.read("app/views/genres/show.html.erb")
    Genre.all.each do |genre|
      @genre = genre # not sure why this is asked for in tests
      File.open("#{@rendered_path}/genres/#{genre.to_slug}.html", "w+") do |f|
        f.puts ERB.new(t).result(binding)
      end
    end
  end

  def build_songs_index
    t = File.read("app/views/songs/index.html.erb")
    File.open("#{@rendered_path}/songs/index.html", "w+") do |f|
      f.puts ERB.new(t).result(binding)
    end
  end

  def build_song_page
    t = File.read("app/views/songs/show.html.erb")
    Song.all.each do |song|
      @song = song # not sure why this is asked for in tests
      File.open("#{@rendered_path}/songs/#{song.to_slug}.html", "w+") do |f|
        f.puts ERB.new(t).result(binding)
      end
    end
  end
end
