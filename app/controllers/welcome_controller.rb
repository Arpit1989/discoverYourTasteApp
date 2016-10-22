class WelcomeController < ApplicationController
  before_action :signed_in? ,:only => :start_survey
  def index
  end

  def start_survey
    @music = Music.random_select_song
    redirect_to music_path(@music.friendly_id)
  end
end
