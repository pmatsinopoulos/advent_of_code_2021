class Point
  include Comparable

  def initialize(x:, y:)
    self.x = x
    self.y = y
  end

  def <=>(value)
    return -1 if self.x < value.x

    if self.x == value.x
      if self.y < value.y
        return -1
      end
      if self.y == value.y
        return 0
      end
      return 1
    end
    1
  end

  attr_reader :x, :y

  private

  attr_writer :x, :y
end
