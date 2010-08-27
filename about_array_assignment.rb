require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutArrayAssignment < EdgeCase::Koan
  def test_non_parallel_assignment
    names = ["John", "Smith"]
    assert_equal ["John", "Smith"], names
  end
  
  def test_parallel_assignments
    first_name, last_name = ["John", "Smith"]
    assert_equal "John", first_name # first_name is set to the first item in array
    assert_equal "Smith", last_name # last_name is set to the second item in array
  end

  def test_parallel_assignments_with_extra_values
    first_name, last_name = ["John", "Smith", "III"]
    assert_equal "John", first_name # first_name is set to the first item in array
    assert_equal "Smith", last_name # last_name is set to the second item in array
  end

  def test_parallel_assignments_with_extra_variables
    first_name, last_name = ["Cher"]
    assert_equal "Cher", first_name # first_name is set to the first item in array
    assert_equal nil, last_name # last_name is nil because there was only 1 item in the array and last_name is the second variable being assigned so there are no items left in the array to select
  end

  def test_parallel_assignements_with_subarrays
    first_name, last_name = [["Willie", "Rae"], "Johnson"] 
    assert_equal ["Willie", "Rae"], first_name # first_name is set to the first item in array (which happens to be another array)
    assert_equal "Johnson", last_name # last_name is set to the second item in array
  end

  def test_parallel_assignment_with_one_variable
    first_name, = ["John", "Smith"]
    assert_equal "John", first_name # first_name is set to the first item in array
  end

  def test_swapping_with_parallel_assignment
    first_name = "Roy"
    last_name = "Rob"
    first_name, last_name = last_name, first_name
    assert_equal "Rob", first_name # first_name is swapped with initial last_name
    assert_equal "Roy", last_name # last_name is swapped with initial first_name
                                  # variables have been swapped without the need for a temporary 3rd variable
  end
end
