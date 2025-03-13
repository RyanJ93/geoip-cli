class IPInfoDTO
    ## Generates an an instance of this class from a given JSON object.
    ##
    ## @param ip [String] The IP address.
    ## @param json [JSON::Any] The JSON object.
    def self.makeFromJSON(ip : String, json : JSON::Any) : IPInfoDTO
        return IPInfoDTO.new(
            json["countryCode"].as_s,
            json.["country"].as_s,
            json.["regionName"].as_s,
            json.["city"].as_s,
            json.["zip"].as_s,
            json.["timezone"].as_s,
            json.["isp"].as_s,
            json.["lat"].as_f,
            json.["lon"].as_f,
            ip
        )
    end

    getter country_code : String = ""
    getter country : String = ""
    getter region_name : String = ""
    getter city : String = ""
    getter zip : String = ""
    getter ip : String = ""
    getter timezone : String = ""
    getter isp : String = ""
    getter latitude : Float64 = 0
    getter longitude : Float64 = 0

    ## The class constructor.
    ##
    ## @param country_code [String] The country code.
    ## @param country [String] The country.
    ## @param region_name [String] The region.
    ## @param city [String] The city.
    ## @param zip [String] The ZIP code.
    ## @param timezone [String] The timezone.
    ## @param isp [String] The ISP.
    ## @param latitude [Float64] The latitude.
    ## @param longitude [Float64] The longitude.
    ## @param ip [String] The IP address.
    def initialize(
        @country_code : String,
        @country : String,
        @region_name : String,
        @city : String,
        @zip : String,
        @timezone : String,
        @isp : String,
        @latitude : Float64,
        @longitude : Float64,
        @ip : String,
    )
    end
end
