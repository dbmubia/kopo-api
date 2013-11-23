require 'helper'

class TestKopoApi < Test::Unit::TestCase
  should "register a client" do
    @client = Kopo::Client.new
    client.configure do |config|
        config.subscriber_message = "screw you"
    end
  end
end
