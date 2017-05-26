require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end 
  def setup 
    @course = Course.new(title: "Basic Math", user_id: 1)
  end

  test "should be valid" do
    assert @course.valid?
  end

  test "name should be present" do
    @course.title = ""
    assert_not @course.valid?
  end

end
