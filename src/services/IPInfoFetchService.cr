require "../DTOs/IPInfoDTO"
require "./Service"
require "http"
require "json"

class IPInfoFetchService < Service
    ENDPOINT_URL = "http://ip-api.com/json/"

    ## The class constructor.
    ##
    ## @param ip [String] The IP address to fetch info for.
    def initialize(@ip : String)
    end

    ## Fetches the IP info from the external API.
    ##
    ## @return [IPInfoDTO] The IP info.
    ##
    ## @raise [IPInfoFetchException] If the IP info could not be fetched.
    def fetch_info() : IPInfoDTO
        begin
            url : String = IPInfoFetchService::ENDPOINT_URL + self.@ip
            request : HTTP::Client::Response = HTTP::Client.get(url)
            json : JSON::Any = JSON.parse(request.body)
            return IPInfoDTO.makeFromJSON(self.@ip, json)
        rescue ex : Exception
            raise IPInfoFetchException.new("Unable to fetch IP info")
        end
    end
end
