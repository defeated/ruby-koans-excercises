# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)

  # "the sum of the lengths of any two sides must be
  # greater than the length of the remaining side."
  #
  # => http://en.wikipedia.org/wiki/Triangle_inequality
  #
  # omg my maths are rusty

  sides = [a, b, c].sort # sort shortest-to-longest
  raise TriangleError if sides.any? { |s| s <= 0 }
  raise TriangleError unless sides[0] + sides[1] > sides[2]

  case sides.uniq.size
    when 1; :equilateral
    when 2; :isosceles
    when 3; :scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
