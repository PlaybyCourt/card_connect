require "test_helper"

class CardConnectTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::CardConnect::VERSION
  end

  def test_it_has_configuration
    assert_respond_to CardConnect, :configure
    assert_respond_to CardConnect, :configuration
  end
end
