require "httparty"
Dir[File.dirname(__FILE__) + '/kopo/*.rb'].each do |file|
  require file
end

module Kopo
    extend Configuration
end
