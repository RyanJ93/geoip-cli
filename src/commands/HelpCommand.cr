require "./Command"

class HelpCommand < Command
    ## Implement command handling logic.
    def handle() : Nil
        puts self.@parser
    end
end
