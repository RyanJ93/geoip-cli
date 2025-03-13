require "./Service"
require "http"
require "json"

class IPFetchService < Service
    ENDPOINT_URL = "https://api64.ipify.org?format=json"

    ## Fetches the IP address from the IPify API
    ##
    ## @return [String] The IP address detected.
    ##
    ## @raise [IPFetchException] If the IP address could not be fetched.
    def fetch_ip() : String
        begin
            request : HTTP::Client::Response = HTTP::Client.get(IPFetchService::ENDPOINT_URL)
            json : JSON::Any = JSON.parse(request.body)
            return json["ip"].as_s
        rescue ex : Exception
            raise IPFetchException.new("Failed to fetch IP address")
        end
    end
end
