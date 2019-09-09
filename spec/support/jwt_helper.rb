require 'devise/jwt/test_helpers'

# module CapybaraHelper
  def auth_headers(headers = default_headers, user)
    Devise::JWT::TestHelpers.auth_headers(headers, user)
  end

  private 

  def default_headers
    { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
  end
# end