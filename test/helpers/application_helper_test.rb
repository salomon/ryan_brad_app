require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "Buddies App"
    assert_equal full_title("About"),"About | Buddies App"
  end
end