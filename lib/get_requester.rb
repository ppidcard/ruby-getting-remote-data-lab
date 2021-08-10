require 'net/http'
require 'open-uri'
require 'json'

class GetRequester
    attr_accessor :url, :res
    @res = ''
    def initialize(url)
        @url = url
        self.getData
    end

    def getData
        uri = URI.parse(url)
        @res = Net::HTTP.get_response(uri)
    end

    def get_response_body
        @res.body
    end

    def parse_json
        JSON.parse(self.get_response_body)
    end
end