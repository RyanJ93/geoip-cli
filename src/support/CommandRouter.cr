require "../commands/Command"
require "option_parser"

class CommandRouter
    @@registered_commands : Hash(String, Command.class) = Hash(String, Command.class).new
    @@instance : CommandRouter? = nil

    ## Return an singleton instance of CommandRouter.
    ##
    ## @return [CommandRouter]
    def self.get_instance() : CommandRouter
        if @@instance.nil?
            @@instance = CommandRouter.new
        end
        return @@instance.not_nil!
    end

    ## Register a command.
    ##
    ## @param command_name [String] The name of the command.
    ## @param command_class [Command] The class of the command.
    def register_command(command_name : String, command_class : Class) : Nil
        @@registered_commands[command_name] = command_class
    end

    ## Execute a command.
    ##
    ## @param command_name [String] The name of the command.
    ## @param parser [OptionParser] The parser.
    ## @param arguments [Hash(String, String)] The arguments.
    def exec(command_name : String, parser : OptionParser, arguments : Hash(String, String)) : Nil
        if @@registered_commands.has_key?(command_name)
            command_class : Command.class = @@registered_commands[command_name]
            command_class.new(parser, arguments).handle()
        else
            puts "Command not found"
        end
    end
end
