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
    song_name = Music.find_by_sql("select DISTINCT song_name from musics ORDER BY random() LIMIT 1");
    Music.find_by_song_name(song_name.first.song_name)
  end

  def self.random_select user
    song_name = Music.find_by_sql("select DISTINCT song_name from musics where SONG_NAME NOT IN('#{user.played_musics.map(&:song_name).uniq.join(",").gsub("'","''").to_s}') ORDER BY random() LIMIT 1");
    Music.find_by_song_name(song_name.first.song_name)
  end


end
