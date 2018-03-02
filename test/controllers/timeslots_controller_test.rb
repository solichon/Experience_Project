require 'test_helper'

class TimeslotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get timeslots_index_url
    assert_response :success
  end

end
