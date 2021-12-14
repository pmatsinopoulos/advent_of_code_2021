class Point
  def initialize(x:, y:)
    self.x = x
    self.y = y
  end

  attr_reader :x, :y

  private

  attr_writer :x, :y
end
