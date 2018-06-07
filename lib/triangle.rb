class Triangle
  attr_accessor :a, :b, :c

  def initialize(a,b,c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    sides = [@a, @b, @c]
    if sides.any?{ |v| v == 0 || v < 0 }
      raise TriangleError
    end

    sides.sort!

    if sides[0] == sides[1] && sides[1] == sides[2]
      :equilateral
    elsif sides[0] < sides[1] && sides[1] == sides[2]
      :isosceles
    elsif (sides[0] + sides[1] <= sides[2])
      raise TriangleError
    elsif sides[0] < sides[1] && sides[1] < sides[2]
      :scalene
    else
      raise TriangleError
    end
  end

  class TriangleError < StandardError
  end
end
