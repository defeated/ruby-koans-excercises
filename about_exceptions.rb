require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutExceptions < EdgeCase::Koan

  class MySpecialError < RuntimeError
  end

  def test_exceptions_inherit_from_Exception
    assert_equal RuntimeError, MySpecialError.ancestors[1] # MySpecialError inherits from RuntimeError
    assert_equal StandardError, MySpecialError.ancestors[2] # RuntimeError inherits from StandardError
    assert_equal Exception, MySpecialError.ancestors[3] # StandardError inherits from Exception
    assert_equal Object, MySpecialError.ancestors[4] # Exception inherits from Object
  end

  def test_rescue_clause
    result = nil
    begin
      fail "Oops"
    rescue StandardError => ex
      result = :exception_handled
    end

    assert_equal :exception_handled, result # fail() raises StandardError

    assert ex.is_a?(StandardError), "Failure message."
    assert ex.is_a?(RuntimeError), "Failure message."

    assert RuntimeError.ancestors.include?(StandardError),
      "RuntimeError is a subclass of StandardError"
    
    assert_equal "Oops", ex.message # whatever was passed to fail()
  end

  def test_raising_a_particular_error
    result = nil
    begin
      # 'raise' and 'fail' are synonyms
      raise MySpecialError, "My Message"
    rescue MySpecialError => ex
      result = :exception_handled
    end

    assert_equal :exception_handled, result
    assert_equal "My Message", ex.message
  end

  def test_ensure_clause
    result = nil
    begin
      fail "Oops"
    rescue StandardError => ex
      # no code here
    ensure
      result = :always_run
    end

    assert_equal :always_run, result
  end

end
