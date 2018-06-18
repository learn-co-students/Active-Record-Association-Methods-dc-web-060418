class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre


  def get_genre_name
    id = self.genre_id
    genre = Genre.all.select {|genre| genre.id == id}[0]
    genre.name
  end

  def drake_made_this
    drake = Artist.new
    drake.name = "Drake"
    self.artist = drake
  end
end
