class Triangle
  attr_reader :side_A, :side_B, :side_C
  def initialize(side_A, side_B, side_C)
    @side_A = side_A
    @side_B = side_B
    @side_C = side_C
  end

  def kind
    validate_triangle
    if side_A == side_B && side_B == side_C
      :equilateral
    elsif side_A == side_B || side_B == side_C || side_A == side_C
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    valid_triangle = [(side_A + side_B > side_C), (side_A + side_C > side_B), (side_B + side_C > side_A)]
    [side_A, side_B, side_C].each do |side|
      valid_triangle << false if side <= 0 
    raise TriangleError if valid_triangle.include?(false)
    end
  end

  class TriangleError < StandardError
  end

end