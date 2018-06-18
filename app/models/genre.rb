class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.length
  end

  def genre_artists
    artist_id = self.songs.select {|song| song.artist_id}
    artist_id.collect {|artist_id| Artist.where(id: artist_id)}.flatten
  end

  def artist_count
    genre_artists.length
  end

  def all_artist_names
    genre_artists.collect {|artist_info| artist_info.name}
  end
end
