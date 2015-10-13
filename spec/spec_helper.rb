require 'bundler/setup'
Bundler.setup

require 'avangate'

RSpec.configure do |config|

  config.before(:all) do
    Avangate::Base.secret_key = "TESTKEY"
    Avangate::Base.merchant_code = "1234567"
  end

end