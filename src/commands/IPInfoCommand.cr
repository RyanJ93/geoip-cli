require "../exceptions/IPInfoFetchException"
require "../exceptions/IPFetchException"
require "../services/IPInfoFetchService"
require "../services/IPFetchService"
require "../support/Printer"
require "../DTOs/IPInfoDTO"
require "./Command"

class IPInfoCommand < Command
    ## Implement command handling logic.
    def handle() : Nil
        begin
            ip : String = ""
            if self.@arguments.has_key?("ip_address")
                ip = self.@arguments["ip_address"]
            else
                ip = IPFetchService.new().fetch_ip()
            end
            ip_info : IPInfoDTO = IPInfoFetchService.new(ip).fetch_info
            Printer.new(ip_info).print()
        rescue ex : IPFetchException
            STDERR.puts "Unable to fetch IP address, aborting!"
            exit(1)
        rescue ex : IPInfoFetchException
            STDERR.puts "Unable to fetch IP info, aborting"
            exit(1)
        end
    end
end
