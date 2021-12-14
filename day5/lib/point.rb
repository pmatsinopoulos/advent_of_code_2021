class Point
  def initialize(x:, y:)
    self.x = x
    self.y = y
  end

  def ==(value)
    self.x == value.x && self.y == value.y
  end

  attr_reader :x, :y

  private

  attr_writer :x, :y
end
