require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutArrays < EdgeCase::Koan
  def test_creating_arrays
    empty_array = Array.new
    assert_equal Array, empty_array.class
    assert_equal 0, empty_array.size
  end

  def test_array_literals
    array = Array.new
    assert_equal [], array

    array[0] = 1
    assert_equal [1], array

    array[1] = 2
    assert_equal [1, 2], array

    array << 333 # push 333 onto the end of the array
    assert_equal [1, 2, 333], array
  end

  def test_accessing_array_elements
    array = [:peanut, :butter, :and, :jelly]

    assert_equal :peanut, array[0]
    assert_equal :peanut, array.first
    assert_equal :jelly, array[3]
    assert_equal :jelly, array.last
    assert_equal :jelly, array[-1] # count 1 from the right
    assert_equal :butter, array[-3] # count 3 from the right
  end

  def test_slicing_arrays
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut], array[0,1] # start at index 0, go 1
    assert_equal [:peanut, :butter], array[0,2] # start at index 0, go 2
    assert_equal [:and, :jelly], array[2,2] # start at index 2, go 2
    assert_equal [:and, :jelly], array[2,20] # start at index 2, goto the end
    assert_equal [], array[4,0] # start at index 4, go none?
    assert_equal nil, array[4] # past the last index
    assert_equal [], array[4,100] # start at index 4, goto the end

    assert_equal nil, array[5,0] # TODO: still wrapping my head around this one.
  end

  def test_arrays_and_ranges
    assert_equal Range, (1..5).class
    assert_not_equal [1,2,3,4,5], (1..5)
    assert_equal [1,2,3,4,5], (1..5).to_a # range of 1 through 5, inclusive
    assert_equal [1, 2, 3, 4], (1...5).to_a # range of 1 to 5, exclusive
  end

  def test_slicing_with_ranges
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut, :butter, :and], array[0..2] # start at index 0, goto index 2
    assert_equal [:peanut, :butter], array[0...2] # start at index 0, goto index 1
    assert_equal [:and, :jelly], array[2..-1] # start at index 2, go 1 from the right
  end

  def test_pushing_and_popping_arrays
    array = [1,2]
    array.push(:last)

    assert_equal [1, 2, :last], array # append :last symbol to end of array

    popped_value = array.pop
    assert_equal :last, popped_value # remove and return last item in array
    assert_equal [1, 2], array # remaining, mutated array
  end

  def test_shifting_arrays
    array = [1,2]
    array.unshift(:first)

    assert_equal [:first, 1, 2], array # prepend :first symbol to beginning of array

    shifted_value = array.shift
    assert_equal :first, shifted_value # remove and return first item in array
    assert_equal [1, 2], array # remaining, mutated array
  end

end
