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
    genres = Music.find_by_sql("select distinct(genre) from musics");
    Music.find_by_genre(genres.sample.genre)
  end

  def self.random_select user
    song_name = Music.find_by_sql("select distinct(song_name) from musics where SONG_NAME NOT IN('#{user.played_musics.map(&:song_name).uniq.join(",").to_s}')");
    Music.find_by_song_name(song_name)
  end


end
