ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false
  fixtures :all

  # Add more helper methods to be used by all tests here...



  def get_with_user(action, parameters = nil, session = nil, flash = nil)
    get action, parameters, :user_id => users(:patrick).id
  end
  def post_with_user(action, parameters = nil, session = nil, flash = nil)
    post action, parameters, :user_id => users(:patrick).id
  end
end
