class MusicsController < ApplicationController
  before_action :signed_in?

  # GET /musics
  # GET /musics.json
  def index
    @musics = Music.all
  end

  # GET /musics/1
  # GET /musics/1.json
  def show
      @music = Music.friendly.find(params[:id])
      # select random genre from all the music
      # create a client object with your app credentials
      client = Soundcloud.new(:client_id => 'd99d78670c7f1d537d0ae3d67a7be95c')
      @embed_info = client.get('/oembed', :url => @music.song_api,:auto_play => true)
  end
  def next_track
    @music = Music.find params[:music]
    if params[:status] == "love"
      played_music = PlayedMusic.find_or_initialize_by(:song_name => @music.song_name)
      played_music.song_api = @music.song_api
      played_music.love = true
      played_music.like = false
      played_music.hate = false
      played_music.not_kind = false
      played_music.genre = @music.genre
      played_music.artist = @music.artist
      current_user.played_musics << played_music
    elsif params[:status] == "kind"
      played_music = PlayedMusic.find_or_initialize_by(:song_name => @music.song_name)
      played_music.song_api = @music.song_api
      played_music.love = false
      played_music.like = false
      played_music.hate = false
      played_music.not_kind = true
      played_music.genre = @music.genre
      played_music.artist = @music.artist
      current_user.played_musics << played_music
    elsif params[:status] == "hate"
      played_music = PlayedMusic.find_or_initialize_by(:song_name => @music.song_name)
      played_music.song_api = @music.song_api
      played_music.love = false
      played_music.like = false
      played_music.hate = true
      played_music.not_kind = false
      played_music.genre = @music.genre
      played_music.artist = @music.artist
      current_user.played_musics << played_music
    elsif params[:status] == "like"
      played_music = PlayedMusic.find_or_initialize_by(:song_name => @music.song_name)
      played_music.song_api = @music.song_api
      played_music.love = false
      played_music.like = true
      played_music.hate = false
      played_music.not_kind = false
      played_music.genre = @music.genre
      played_music.artist = @music.artist
      current_user.played_musics << played_music
    end
      genres = Music.find_by_sql("select distinct(genre) from musics");
      @next_music = Music.find_by_genre(genres.sample.genre)
    if @next_music.id == @music.id
      @next_music = Music.random_select(current_user)
      redirect_to music_path(@next_music.friendly_id)
    elsif current_user.played_musics.select(:song_name).include?(@next_music.song_name)
      @next_music = Music.random_select(current_user)
      redirect_to music_path(@next_music.friendly_id)
    elsif @next_music.nil?
      @next_music = Music.random_select(current_user)
      redirect_to music_path(@next_music.friendly_id)
    else
      redirect_to music_path(@next_music.friendly_id)
    end
  end

  # GET /musics/new
  def new
    @music = Music.new
  end

  # GET /musics/1/edit
  def edit
  end

  # POST /musics
  # POST /musics.json
  def create
    @music = Music.new(music_params)

    respond_to do |format|
      if @music.save
        format.html { redirect_to @music, notice: 'Music was successfully created.' }
        format.json { render :show, status: :created, location: @music }
      else
        format.html { render :new }
        format.json { render json: @music.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /musics/1
  # PATCH/PUT /musics/1.json
  def update
    respond_to do |format|
      if @music.update(music_params)
        format.html { redirect_to @music, notice: 'Music was successfully updated.' }
        format.json { render :show, status: :ok, location: @music }
      else
        format.html { render :edit }
        format.json { render json: @music.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /musics/1
  # DELETE /musics/1.json
  def destroy
    @music.destroy
    respond_to do |format|
      format.html { redirect_to musics_url, notice: 'Music was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_music
      @music = Music.random_select
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def music_params
      params.require(:music).permit(:artist, :song_name, :song_api, :genre, :slug)
    end
end
