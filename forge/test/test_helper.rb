# frozen_string_literal: true

require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'

class ActiveSupport
  class TestCase
  end
  fixtures :all
end
