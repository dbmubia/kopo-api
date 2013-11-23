module Kopo
    module Configuration
        VALID_CONFIG_OPTIONS = [:base_uri, :api_key, :format, :subscriber_message, :responses]

        DEFAULT_BASE_URI = 'http://kopokopo.com'
        DEFAULT_API_KEY = nil
        DEFAULT_FORMAT = :json
        DEFAULT_SUBSCRIBER_MESSAGE = 'Thank you!'
        DEFAULT_RESPONSES = {
            01 => {
                status: 01,
                description: 'Accepted' },
            02 => {
                status: 02,
                description: 'Account not found' },
            03 => {
                status: 03,
                description: 'Invalid payment' },
        }

        attr_accessor *VALID_CONFIG_OPTIONS

        def self.extended(base)
            base.reset
        end

        def reset
            self.base_uri = DEFAULT_BASE_URI
            self.api_key = DEFAULT_API_KEY
            self.format = DEFAULT_FORMAT
            self.subscriber_message = DEFAULT_SUBSCRIBER_MESSAGE
            self.responses = DEFAULT_RESPONSES
        end

        def configure
            yield self
        end

        def options
            Hash[ * VALID_CONFIG_OPTIONS.map { |key| [key, send(key)] }.flatten ]
        end
    end
end