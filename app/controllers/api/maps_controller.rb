  module Api
  class MapsController < ApplicationController
    
    # Define left right up and down methods for map
    %w(left right up down in out).each do |method|
      define_method (method) do
        current_user.map.method("move_#{method}").call
        if current_user.map.save
          render status: 201, text: "Map was moved #{method} successfully."
        else
          errors = current_user.map.errors.messages.collect { |k,v| "#{k} #{v.join}" }.join
          render status: 500, text: "Error: #{errors}"
        end
      end
    end
  end
end