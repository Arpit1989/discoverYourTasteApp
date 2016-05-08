json.array!(@musics) do |music|
  json.extract! music, :id, :artist, :song_name, :song_api, :genre, :slug
  json.url music_url(music, format: :json)
end
