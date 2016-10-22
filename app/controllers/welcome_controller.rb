class WelcomeController < ApplicationController
  before_action :signed_in? ,:only => [:start_survey,:profile]
  def index
  end

  def start_survey
    @music = Music.random_select_song
    redirect_to music_path(@music.friendly_id)
  end

  def profile
    @user = current_user
  end
end
