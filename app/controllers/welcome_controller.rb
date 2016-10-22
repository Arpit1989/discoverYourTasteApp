class WelcomeController < ApplicationController
  before_action :signed_in? ,:only => :start_survey
  def index
  end

  def start_survey
    @music = Music.random_select;
    redirect_to action: "show", id: @music.friendly_id ,controller: "musics"
  end
end
