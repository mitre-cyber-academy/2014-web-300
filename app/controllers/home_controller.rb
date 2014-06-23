require 'digest'

class HomeController < ApplicationController
  def index
    map = current_user.map
    @img = Digest::MD5.hexdigest(Digest::MD5.hexdigest("#{map.latitude}x#{map.longitude}x#{map.zoom}")) << ".jpeg"
  end
end
