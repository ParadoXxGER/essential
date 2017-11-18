require 'test_helper'
require "authlogic/test_case"


class RedisSessionTest < ActionDispatch::IntegrationTest

  setup :activate_authlogic

  test "A new session in redis" do

    one = users(:one)
    assert_nil controller.session["user_credentials"]
    assert UserSession.create(one)
    assert_equal controller.session["user_credentials"], one.persistence_token

  end

end