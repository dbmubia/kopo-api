module Kopo
    class Client
        include "httparty"
        attr_accessor *Configuration::VALID_CONFIG_OPTIONS
        base_uri self.options[:base_uri]

        def initialize(options={})
            # Merge default config with passed options
            merged_options = Kopo.options.merge(options)

            # Copy merged values to new client
            Configuration::VALID_CONFIG_OPTIONS.each do |key|
                send("#{key}=", merged_options[key])
            end
        end

        def parse (parameters, &block)
            # AUTHENTICATE KOPO REQUEST
            process = true # OUTPUT OF AUTH PROCESS
            status_code = 01 # CONTINGENT ON AUTH PROCESS

            options = self.responses[status_code] || self.responses[03]
            options[:subscriber_message] = self.subscriber_message
            self.post('/kopo/response/uri', options)

            yield process
        end

        private

        def post (params)
            options = { query: params }
            self.class.post('/kopo/response/uri', options)
        end

    end
end