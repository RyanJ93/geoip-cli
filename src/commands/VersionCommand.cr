require "./Command"

class VersionCommand < Command
    ## Implement command handling logic.
    def handle() : Nil
        puts "GeoIP CLI v0.1.0"
    end
end
