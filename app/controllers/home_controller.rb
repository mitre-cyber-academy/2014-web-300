require 'digest'

class HomeController < ApplicationController
  def index
  	@img = Digest::MD5.hexdigest(Digest::MD5.hexdigest("1x8x0")) << ".jpeg"
  end
end
