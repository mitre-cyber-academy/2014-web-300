require 'digest'

class HomeController < ApplicationController
  def index
  	@img = Digest::MD5.hexdigest(Digest::MD5.hexdigest("1x8x0")) << ".jpeg"
  end

  def buttons
  	redirect_to :back,flash:{info:"Sorry, Bro. Still integrating the API for that."}
  end
end
