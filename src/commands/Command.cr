abstract class Command
    ## The class constructor.
    ##
    ## - parser: The OptionParser instance.
    ## - arguments: The arguments passed to the command.
    def initialize(@parser : OptionParser, @arguments : Hash(String, String))
    end

    ## Implement command handling logic.
    abstract def handle() : Nil
end
