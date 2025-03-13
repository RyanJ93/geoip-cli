require "../DTOs/IPInfoDTO"

class Printer
    BASE_MAP_URL = "https://beta.maps.apple.com?z=15&t=h"

    ## The class constructor.
    ##
    ## @param ip_info [IPInfoDTO] The IP information to print.
    def initialize(@ip_info : IPInfoDTO)
    end

    ## Prints the IP information.
    def print() : Nil
        puts "Location found for IP address #{self.@ip_info.ip}:"
        puts "Country: #{@ip_info.country} (#{@ip_info.country_code})"
        puts "Region: #{@ip_info.region_name}"
        puts "City: #{@ip_info.city}"
        puts "ZIP: #{@ip_info.zip}"
        puts "Timezone: #{@ip_info.timezone}"
        puts "ISP: #{@ip_info.isp}"
        puts "\nCoordinates: #{@ip_info.latitude}, #{@ip_info.longitude}"
        puts "Maps URL: #{self.build_maps_url()}"
    end

    ## Builds the maps URL.
    ##
    ## @return [String] The maps URL.
    private def build_maps_url() : String
        return Printer::BASE_MAP_URL + "&ll=#{@ip_info.latitude},#{@ip_info.longitude}"
    end
end
