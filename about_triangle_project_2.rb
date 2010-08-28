require File.expand_path(File.dirname(__FILE__) + '/edgecase')

# You need to write the triangle method in the file 'triangle.rb'
require 'triangle.rb'

class AboutTriangleAssignment2 < EdgeCase::Koan
  # The first assignment did not talk about how to handle errors.
  # Let's handle that part now.
  def test_illegal_triangles_throw_exceptions
    assert_raise(TriangleError) do triangle(0, 0, 0) end # a side can't be 0
    assert_raise(TriangleError) do triangle(3, 4, -5) end # a side can't be negative
    assert_raise(TriangleError) do triangle(1, 1, 3) end # a side can't be too long
    assert_raise(TriangleError) do triangle(2, 4, 2) end # a side can't be too short
 end
end
  
