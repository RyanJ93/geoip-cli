require "./commands/VersionCommand"
require "./commands/IPInfoCommand"
require "./support/CommandRouter"
require "./commands/HelpCommand"
require "option_parser"

arguments : Hash(String, String) = Hash(String, String).new
command : String = "ip_info"

CommandRouter.get_instance().register_command("version", VersionCommand)
CommandRouter.get_instance().register_command("ip_info", IPInfoCommand)
CommandRouter.get_instance().register_command("help", HelpCommand)

parser : OptionParser = OptionParser.new do |parser|
    parser.banner = "geoip-cli [arguments]"

    parser.on("-i IP", "--ip=IP", "Some IP address to fetch info for.") { |ip| arguments["ip_address"] = ip }
    parser.on("-v", "--version", "Show version") { command = "version" }
    parser.on("-h", "--help", "Show help") { command = "help" }

    parser.invalid_option do |flag|
        STDERR.puts "ERROR: #{flag} is not a valid option."
        STDERR.puts parser
        exit(1)
    end
end

parser.parse()

CommandRouter.get_instance().exec(command, parser, arguments)
