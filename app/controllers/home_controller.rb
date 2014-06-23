require 'digest'

class HomeController < ApplicationController
  def index
    map = current_user.map
    @img = Digest::MD5.hexdigest(Digest::MD5.hexdigest("#{map.latitude}x#{map.longitude}x#{map.zoom}")) << ".jpeg"
  end

  def buttons
  	redirect_to :back,flash:{info:"Sorry, Bro. Still integrating the API for that."}
  end
end
