class Map < ActiveRecord::Base
  belongs_to :user

  %w(longitude latitude zoom).each do |method|
    define_method ("#{method}=") do |value|
      if self.updated_at > 5.seconds.ago or self.is_reset?
        super(value)
      else
        self.reset
      end
    end
  end

  def reset
    write_attribute(:longitude, 0)
    write_attribute(:latitude, 0)
    write_attribute(:zoom, 0)
  end

  def is_reset?
    self.longitude.eql? 0 and self.latitude.eql? 0 and self.zoom.eql? 0
  end
end
