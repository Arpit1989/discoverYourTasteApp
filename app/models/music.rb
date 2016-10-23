class Music < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
        :genre,
        [:genre, :artist],
        [:genre, :artist, :song_name],
    ]
  end

  def self.random_select_song
    genres = Music.find_by_sql("select DISTINCT song_name,genre from musics ORDER BY song_name,genre");
    Music.find_by_genre(genres.sample.genre)
  end

  def self.random_select user
    song_name = Music.find_by_sql("select DISTINCT song_name,genre from musics where SONG_NAME NOT IN('#{user.played_musics.map(&:song_name).uniq.join(",").to_s}') ORDER BY song_name,genre");
    Music.find_by_song_name(song_name)
  end


end
