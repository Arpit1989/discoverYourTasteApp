class WelcomeController < ApplicationController
  def index
  end

  def start_survey
    @music = Music.friendly.find 1;
    redirect_to action: "show", id: @music.friendly_id ,controller: "musics"
  end
end
