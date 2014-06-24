class Map < ActiveRecord::Base
  belongs_to :user

  validates :longitude, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10,
    only_integer: true
  }

  validates :latitude, :zoom, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 2,
    only_integer: true
  }

  %w(longitude latitude zoom).each do |method|
    define_method ("#{method}=") do |value|
      if self.updated_at > 5.seconds.ago or self.is_reset?
        super(value)
      else
        self.reset
      end
    end
  end

  def move_left
    self.longitude-=1
  end

  def move_right
    self.longitude+=1
  end

  def move_up
    self.latitude-=1
  end

  def move_down
    self.latitude+=1
  end

  def move_in
    self.zoom+=1
  end

  def move_out
    self.zoom-=1
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
